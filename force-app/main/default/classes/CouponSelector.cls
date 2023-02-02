public inherited sharing class CouponSelector {
    
    public static List<Coupon__c> getCouponsByisActive(Boolean isActive){
        return [SELECT Id, Name FROM Coupon__c WHERE Active__c = :isActive];
    }

    public static List<Coupon__c> getCouponsByNames(List<String> name){
        return [SELECT Id, Name FROM Coupon__c WHERE Name IN :name];
    }
}
