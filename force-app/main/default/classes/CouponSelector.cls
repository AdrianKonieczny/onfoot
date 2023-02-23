public inherited sharing class CouponSelector {
    
    /**
     * @description - retrieves active coupons
     * @param isActive - Boolean isActive
     * @return - List<Coupon__c>()
     */
    public static List<Coupon__c> getCouponsByisActive(Boolean isActive){
        return [SELECT Id, Name FROM Coupon__c WHERE Active__c = :isActive];
    }

    /**
     * @description - retrieves coupons
     * @param name - name
     * @return - List<Coupon__c>()
     */
    public static List<Coupon__c> getCouponsByNames(List<String> name){
        return [SELECT Id, Name FROM Coupon__c WHERE Name IN :name];
    }
}
