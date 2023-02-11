public inherited sharing class TestSelector {
    
    public static List<Account> getAccountsContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account];
    }

    public static List<Account> getAccountsByPositiveContactCount(){
        return [SELECT Id, Contact_Count__c FROM Account WHERE Contact_Count__c > 0];
    }
    public static Account getAccount(){
        return [SELECT Id, Customer_Status__c FROM Account LIMIT 1];
    }
    
    public static Product2 getProduct(){
        return [SELECT Id FROM Product2 LIMIT 1];  
    }
}
