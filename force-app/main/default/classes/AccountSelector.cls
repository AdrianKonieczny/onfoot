public inherited sharing class AccountSelector {
    
    /**
     * @description - retrieves accounts
     * @param accIDs - Account Ids
     * @return - List<Account>()
     */
    public static List<Account> getAccountsByIDs(List<Id> accIDs){
        if(accIDs == null || accIDs.isEmpty()){
            return new List<Account>();
        }
         return [
            SELECT Id, Contact_Count__c, (SELECT Id FROM Contacts)
            FROM Account 
            WHERE Id 
            IN :accIDs
        ];
    }

    /**
     * @description - retrieves accounts
     * @param accountIds - account ids
     * @return - List<Account_Coupon__c>()
     */
    public static List<Account_Coupon__c> getAccountCoupons(List<Id> accountIds){
        return [SELECT Id FROM Account_Coupon__c WHERE Account__c IN :accountIds];
    }
}


