public inherited sharing class TestSelector {
    
    public static List<Account> getAccountsContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account];
    }

    public static List<Account> getAccountsByPositiveContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account WHERE Contact_Count__c > 0];
    }

    public static List<Contact> getContacts(){
        return [SELECT Id FROM Contact];
    }

    public static List<Case> getCases(){
        return [SELECT Id FROM Case];
    }

    public static Case getCaseBySecurityCode(List<String> SecurityCode){
        return [SELECT Id, Security_Code__c FROM Case WHERE Security_Code__c = :SecurityCode LIMIT 1];
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
}
