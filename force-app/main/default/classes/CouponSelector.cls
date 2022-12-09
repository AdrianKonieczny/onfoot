public inherited sharing class CouponSelector {
    
    public static List<Coupon__c> getActiveCoupons(){
        return [SELECT Id, Name FROM Coupon__c WHERE Active__c = true];
    }
}
