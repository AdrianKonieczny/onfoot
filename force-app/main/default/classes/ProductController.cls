public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(){
        return ProductSelector.getProducts();
    }
}