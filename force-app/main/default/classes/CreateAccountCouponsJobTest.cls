@IsTest
public with sharing class CreateAccountCouponsJobTest {
    
    public static final String PROD_NAME = 'tstProd';

    @TestSetup
    static void setup(){    
        Product2 testProd = (Product2)TestFactory.createSObject(new Product2(), TestFactoryDefaults.ProductDefaults.class.toString(), true);        
        Account testAccount = (Account)TestFactory.createSObject(new Account(Customer_Status__c = Constants.CUSTOMER_STATUS_SILVER), TestFactoryDefaults.AccountDefaults.class.toString(), true);        
        Coupon__c testCoupon = (Coupon__c)TestFactory.createSObject(new Coupon__c(), TestFactoryDefaults.CouponDefaults.class.toString(), true);                     
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