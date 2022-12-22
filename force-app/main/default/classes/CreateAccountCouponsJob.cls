public without sharing class CreateAccountCouponsJob implements Database.Batchable<sObject>, Schedulable{
    private Map<String, Coupon__c> couponByName = CouponService.getCouponByName();    

    public Database.QueryLocator start(Database.BatchableContext context) {       
        return Database.getQueryLocator([SELECT Id, Customer_Status__c FROM Account WHERE Customer_Status__c != null]);
    }

    public void execute(Database.BatchableContext context, List<Account> scope) {
        List<Product2> newProducts = ProductSelector.getProductsByCouponCreated(false);
        List<Account_Coupon__c> accCouponsToInsert = new List<Account_Coupon__c>();
        for(Account acc : scope){          
            for(Product2 prod : newProducts){
               Account_Coupon__c accCoupon = new Account_Coupon__c(Account__c = acc.Id, Coupon__c = couponByName.get(acc.Customer_Status__c).Id, Product__c = prod.Id);
               accCouponsToInsert.add(accCoupon);
               prod.Coupon_Created__c = true;
            }        
        }
        insert accCouponsToInsert;   
        update newProducts;    
    }

    public void finish(Database.BatchableContext context) {
        
    }

    public void execute(SchedulableContext context) {
        Database.executeBatch(new CreateAccountCouponsJob());
    }
}
