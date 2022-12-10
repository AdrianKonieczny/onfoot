public inherited sharing class TestSelector {
    
    public static List<Account> getAccountsContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account];
    }

    public static List<Account> getAccountsByPositiveContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account WHERE Contact_Count__c > 0];
    }
}
