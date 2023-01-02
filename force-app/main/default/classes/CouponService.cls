public inherited sharing class CouponService {
    public static Map<String, Coupon__c> getCouponByName(Boolean isActive){        
        Map<String, Coupon__c> couponByName = new Map<String, Coupon__c>();
            if(isActive){
            for(Coupon__c coup : CouponSelector.getActiveCoupons()){
                couponByName.put(coup.Name, coup);
            }
            return couponByName;
        }
    return couponByName;
    }
}
