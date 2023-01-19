public inherited sharing class AccountSelector {
    
    public static List<Account_Coupon__c> getAccountCoupons(List<Id> accountIds){
        return [SELECT Id FROM Account_Coupon__c WHERE Account__c IN :accountIds];
    }
}
