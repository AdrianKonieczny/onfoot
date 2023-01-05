@IsTest
public with sharing class CreateAccountCouponsJobTest {
    
    public static final String PROD_NAME = 'tstProd';
    public static final String ACC_NAME = 'tstAcc';

    @TestSetup
    static void setup(){    
        Product2 testProduct = new Product2(Name = PROD_NAME, Category__c = Constants.PRODUCT_CATEGORY_CASUAL , Construction__c = Constants.PRODUCT_CONSTRUCTION_LOW, Material__c = Constants.PRODUCT_MATERIAL_LEATHER, Price__c = 100, Picture_URL__c = 'xd.pl');        
        Account testAccount = new Account(Name = ACC_NAME, Customer_Status__c = Constants.CUSTOMER_STATUS_SILVER);        
        Coupon__c testCoupon = new Coupon__c(Name = Constants.CUSTOMER_STATUS_SILVER, Value__c = 10, Start_Date__c = Datetime.Now(), End_Date__c = Datetime.Now().addYears(1));            
        insert testAccount;
        insert testCoupon;  
        insert testProduct;     
    }            

    @IsTest
    private static void shouldCreateAccountCoupon(){              
        Account testAccount = TestSelector.getAccount();     
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});
            
        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});
        System.assertEquals(accCoupons.size()+1, updatedAccCoupons.size(), 'accCoupons size should not be equal to updatedAccCoupons size');
    }

    @IsTest 
    private static void shouldNotCreateAccountCoupon(){
        Account testAccount = TestSelector.getAccount();     
        Coupon__c testCoupon = CouponSelector.getCouponsByNames(new List<String>{Constants.CUSTOMER_STATUS_SILVER}).get(0);
                       
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});

        testCoupon.Name = Constants.CUSTOMER_STATUS_GOLD;
        update testCoupon;

        Test.startTest();     
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should be equal to updatedAccCoupons because Silver Coupon doesnt exist.');
    }

    @IsTest 
    private static void shouldNotCreateAccountCouponJunctionObjectAlreadyExists(){       
        Product2 testProduct = TestSelector.getProduct();  
        Account testAccount = TestSelector.getAccount();        
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});

        testProduct.Coupon_Created__c = true;
        update testProduct;

        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(new List<Id>{testAccount.Id});
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'Account Coupon shouldnt be created as Product2.CouponCreated__c = true');
    }
}