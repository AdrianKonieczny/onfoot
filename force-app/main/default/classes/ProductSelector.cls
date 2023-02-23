public inherited sharing class ProductSelector {
    
    public static List<Product2> getProductsByCouponCreated(Boolean isCouponCreated){
        if(isCouponCreated == null){
            return new List<Product2>();
        }
        return [
            SELECT Id 
            FROM Product2 
            WHERE Coupon_Created__c = :isCouponCreated
        ];
    }

    /**
     * @description - retrieves product
     * @param - no param
     * @return - List<Product2>()
     */
    public static List<Product2> getProducts(){
        return [SELECT Id, Name, Picture_URL__c, Material__c, Construction__c, Category__c, Description, (SELECT Id, Pricebook2.Name, UnitPrice FROM PricebookEntries) FROM Product2];
    }
}
