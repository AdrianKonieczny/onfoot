public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(){
        return [SELECT Id, Name, Price__c, Picture_URL__c, Material__c, Construction__c, Category__c, Description, (SELECT Id, Pricebook2.Name, UnitPrice FROM PricebookEntries) FROM Product2];
    }
}