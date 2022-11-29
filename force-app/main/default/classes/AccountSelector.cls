public inherited sharing class AccountSelector {
    
    public static List<Account> getAccountsByIDs(List<Id> accIDs){
         return [
            SELECT Id, Contact_Count__c 
            FROM Account 
            WHERE Id 
            IN :accIDs
            ];
    }
}