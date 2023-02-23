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
}