public inherited sharing class TestSelector {  
    public static List<Account_Coupon__c> getAccountCoupons(){
        return [SELECT Id FROM Account_Coupon__c];
    }
}
