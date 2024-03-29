public inherited sharing class TestSelector {   
    
    public static List<Contact> getContacts(){
        return [SELECT Id FROM Contact];
    }

    public static List<Case> getCases(){
        return [SELECT Id, State__c FROM Case];
    }

    public static Account getAccountContactCountByName(String accName){
        return [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName];
    }

    public static List<Contact> getContactsByAccountId(List<Id> accountId){
        return [SELECT Id, AccountId FROM Contact WHERE AccountId = :accountId];
    }

    public static Contact getContactByLastname(String ctName){
        return [SELECT Id, AccountId FROM Contact WHERE Lastname = :ctName];
    }
    public static Account getAccount(){
        return [SELECT Id, Customer_Status__c FROM Account LIMIT 1];
    }
    
    public static Product2 getProduct(){
        return [SELECT Id FROM Product2 LIMIT 1];  
    }
}
