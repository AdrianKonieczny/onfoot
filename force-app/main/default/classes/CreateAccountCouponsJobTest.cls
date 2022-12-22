@IsTest
public with sharing class CreateAccountCouponsJobTest {
    
    @IsTest
    private static void shouldCreateAccountCoupon(){
        String silver = 'Silver';
        Product2 testProduct = new Product2(Name = 'tst', Category__c = 'Casual', Construction__c = 'Low', Material__c = 'Leather', Price__c = 100, Picture_URL__c = 'xd.pl');
        Account testAccount = new Account(Name = 'tstAcc', Customer_Status__c = silver);
        Coupon__c testCounpon = new Coupon__c(Name = silver, Value__c = 10, Start_Date__c = Datetime.newInstance(2022, 1, 1), End_Date__c = Datetime.newInstance(2024, 12, 31));
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons();

        insert testProduct;
        insert testAccount;
        insert testCounpon;

        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons();
        System.assertNotEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should not be equal to updatedAccCoupons size');

    }
    @IsTest 
    private static void shouldNotCreateAccountCoupon(){ //no adequate Coupon Name
        Product2 testProduct = new Product2(Name = 'tst', Category__c = 'Casual', Construction__c = 'Low', Material__c = 'Leather', Price__c = 100, Picture_URL__c = 'xd.pl');
        Account testAccount = new Account(Name = 'tstAcc', Customer_Status__c = 'Silver');
        Coupon__c testCounpon = new Coupon__c(Name = 'Gold', Value__c = 10, Start_Date__c = Datetime.newInstance(2022, 1, 1), End_Date__c = Datetime.newInstance(2024, 12, 31));
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons();

        insert testProduct;
        insert testAccount;
        insert testCounpon;

        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons();
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should be equal to updatedAccCoupons size');
    }

    @IsTest 
    private static void shouldNotCreateAccountCoupon2(){ // CouponCreated checkbox on Product2 = true;
        String silver = 'Silver';
        Product2 testProduct = new Product2(Name = 'tst', Category__c = 'Casual', Construction__c = 'Low', Material__c = 'Leather', Price__c = 100, Picture_URL__c = 'xd.pl', Coupon_Created__c = true);
        Account testAccount = new Account(Name = 'tstAcc', Customer_Status__c = silver);
        Coupon__c testCounpon = new Coupon__c(Name = silver, Value__c = 10, Start_Date__c = Datetime.newInstance(2022, 1, 1), End_Date__c = Datetime.newInstance(2024, 12, 31));
        List<Account_Coupon__c> accCoupons = TestSelector.getAccountCoupons();

        insert testProduct;
        insert testAccount;
        insert testCounpon;

        Test.startTest();
        Database.executeBatch(new CreateAccountCouponsJob());
        Test.stopTest();

        List<Account_Coupon__c> updatedAccCoupons = TestSelector.getAccountCoupons();
        System.assertEquals(accCoupons.size(), updatedAccCoupons.size(), 'accCoupons size should be equal to updatedAccCoupons size');
    }
}