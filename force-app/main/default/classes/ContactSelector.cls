public inherited sharing class ContactSelector {
    
    public static List<Contact> getContactsByAccountIDs(List<Id> accIDs){
         return [
            SELECT Id, AccountId 
            FROM Contact 
            WHERE AccountId 
            IN :accIDs
            ];
    }
}
