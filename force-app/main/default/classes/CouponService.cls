public inherited sharing class CouponService {
    public static Map<String, Coupon__c> getCouponByName(){
        Map<String, Coupon__c> couponByName = new Map<String, Coupon__c>();
        for(Coupon__c coup : CouponSelector.getActiveCoupons()){
            couponByName.put(coup.Name, coup);
        }
        return couponByName;
    }
}
