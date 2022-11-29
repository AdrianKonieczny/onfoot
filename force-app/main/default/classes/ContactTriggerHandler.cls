public with sharing class ContactTriggerHandler extends TriggerHandler {
    
    List<Contact> newContacts = Trigger.new;
    List<Contact> deletedContacts = Trigger.old;

    public override void afterInsert(){
        countContactsConnectedToAccount();
    }
    
    public override void afterDelete(){
        countContactsConnectedToAccount();
    }


    private void countContactsConnectedToAccount(){       
        List<Contact> contactList = new List<Contact>();
        List<Account> accountList = new List<Account>();  
        List<Id> accIDs = new List<Id>();     

        if(Trigger.isInsert){
            for(Contact ct : newContacts){      
                accIDs.add(ct.AccountId);              
            }
        }         
        
        if(Trigger.isDelete){
            for(Contact ct : deletedContacts){
                accIDs.add(ct.AccountId); 
            }          
        }

        if(accIDs.size() > 0){
            contactList = ContactSelector.getContactsByAccountIDs(accIDs);
            accountList = AccountSelector.getAccountsByIDs(accIDs);
        }
        for(Account acc : accountList){
            acc.Contact_Count__c = contactList.size();
        }
        update accountList;
    }
}
