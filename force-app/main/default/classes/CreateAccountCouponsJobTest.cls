@IsTest
public with sharing class CreateAccountCouponsJobTest {
    
    private static String prodName = 'tstProd';
    private static String accName = 'tstAcc';

    @TestSetup
    static void setup(){    
        Product2 testProduct = new Product2(Name = prodName, Category__c = Constants.PRODUCT2_CATEGORY_CASUAL , Construction__c = Constants.PRODUCT2_CONSTRUCTION_LOW, Material__c = Constants.PRODUCT2_MATERIAL_LEATHER, Price__c = 100, Picture_URL__c = 'xd.pl');        
        Account testAccount = new Account(Name = accName, Customer_Status__c = Constants.CUSTOMER_STATUS_SILVER);        
        Coupon__c testCoupon = new Coupon__c(Name = Constants.CUSTOMER_STATUS_SILVER, Value__c = 10, Start_Date__c = Datetime.Now(), End_Date__c = Datetime.Now().addYears(1));    
        Map<Id, Account> accIds = new Map<Id,Account>();
        insert testAccount;
        insert testCoupon;  
        insert testProduct;     
    }            

    @IsTest
    private static void shouldCreateAccountCoupon(){    
        List<Id> accountIds = new List<Id>(new Map<Id, Account>([SELECT Id FROM Account]).keySet());
        Product2 prod = [SELECT Id FROM Product2 WHERE NAME = :prodName LIMIT 1];    
        Account testAccount = [SELECT Id, Customer_Status__c FROM Account WHERE Name = :accName LIMIT 1];  
        Coupon__c testCounpon = [SELECT Id FROM Coupon__c WHERE Name = :Constants.CUSTOMER_STATUS_SILVER LIMIT 1];
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(accountIds);
            
        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(accountIds);
        System.assertNotEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should not be equal to updatedAccCoupons size');
    }

    @IsTest 
    private static void shouldNotCreateAccountCoupon(){
        List<Id> accountIds = new List<Id>(new Map<Id, Account>([SELECT Id FROM Account]).keySet());
        Account testAccount = [SELECT Id, Customer_Status__c FROM Account WHERE Name = :accName LIMIT 1]; 
        Coupon__c testCoupon = [SELECT Id, Name FROM Coupon__c WHERE Name = :Constants.CUSTOMER_STATUS_SILVER LIMIT 1];
        Product2 testProduct = [SELECT Id FROM Product2 WHERE NAME = :prodName LIMIT 1];               
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(accountIds);

        testCoupon.Name = Constants.CUSTOMER_STATUS_GOLD;
        update testCoupon;

        Test.startTest();     
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(accountIds);
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should be equal to updatedAccCoupons because Silver Coupon doesnt exist.');
    }

    @IsTest 
    private static void shouldNotCreateAccountCouponJunctionObjectAlreadyExists(){ 
        List<Id> accountIds = new List<Id>(new Map<Id, Account>([SELECT Id FROM Account]).keySet());
        Product2 testProduct = [SELECT Id FROM Product2 WHERE NAME = :prodName LIMIT 1];  
        Account testAccount = [SELECT Id, Customer_Status__c FROM Account WHERE Name = :accName LIMIT 1]; 
        Coupon__c testCounpon = [SELECT Id, Name FROM Coupon__c WHERE Name = :Constants.CUSTOMER_STATUS_SILVER LIMIT 1];
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons(accountIds);

        testProduct.Coupon_Created__c = true;
        update testProduct;

        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons(accountIds);
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'Account Coupon shouldnt be created as Product2.CouponCreated__c = true');
    }
}