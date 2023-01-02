public with sharing class ContactTriggerHandler extends TriggerHandler {
    
    List<Contact> newContacts = Trigger.new;
    List<Contact> deletedContacts = Trigger.old;

    public override void afterInsert(){
        countContactsConnectedToAccount();
    }
    
    public override void afterDelete(){
        countContactsConnectedToAccount();
    }

    public override void afterUpdate(){
        countContactsConnectedToAccount();
    }


    private void countContactsConnectedToAccount(){                      
        List<Id> accIDs = new List<Id>();            
        List<Contact> tempContacts = Trigger.isDelete ? deletedContacts : newContacts;
             
        for(Contact ct : tempContacts){
            accIDs.add(ct.AccountId); 
        }              
       
        List<Account> accounts = AccountSelector.getAccountsByIDs(accIDs);        
        for(Account acc : accounts){
            acc.Contact_Count__c = acc.Contacts.size();
        }
        update accounts;
    }
}
