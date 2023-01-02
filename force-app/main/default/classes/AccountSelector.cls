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

}