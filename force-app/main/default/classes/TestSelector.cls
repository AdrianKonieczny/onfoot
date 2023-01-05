public inherited sharing class TestSelector {  

    public static Account getAccount(){
        return [SELECT Id, Customer_Status__c FROM Account LIMIT 1];
    }
    
    public static Product2 getProduct(){
        return [SELECT Id FROM Product2 LIMIT 1];  
    }
}
