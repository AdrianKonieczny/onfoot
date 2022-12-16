public without sharing class CreateAccountCouponsJob implements Database.Batchable<sObject>, Schedulable{
    private Map<String, Coupon__c> couponByName = CouponService.getCouponByName();
    private List<Product2> newProducts;

    public Database.QueryLocator start(Database.BatchableContext context) {
        newProducts = ProductSelector.getProductsByCouponCreated(false);
        return Database.getQueryLocator([SELECT Id, Customer_Status__c FROM Account WHERE Customer_Status__c != null]);
    }

    public void execute(Database.BatchableContext context, List<Account> scope) {
        List<Account_Coupon__c> accCouponsToInsert = new List<Account_Coupon__c>();
        for(Account acc : scope){
            for(Product2 prod : newProducts){
               Account_Coupon__c accCoupon = new Account_Coupon__c(Account__c = acc.Id, Coupon__c = couponByName.get(acc.Customer_Status__c).Id);
               accCouponsToInsert.add(accCoupon);
            }        
        }
        insert accCouponsToInsert;       
    }

    public void finish(Database.BatchableContext context) {
        
    }

    public void execute(SchedulableContext context) {
        Database.executeBatch(new CreateAccountCouponsJob());
    }
}
