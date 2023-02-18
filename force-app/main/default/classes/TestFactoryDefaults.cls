@IsTest
public  class TestFactoryDefaults{

    // To specify defaults for objects, use the naming convention [ObjectName]Defaults.
    // For custom objects, omit the __c from the Object Name

    public class AccountDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Account.Name => 'Test Account'
            };
        }
    }

    public class MyAccountDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Account.Name => 'My Test Account'
            };
        }
    }

    public class ContactDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Contact.FirstName => 'First',
                    Contact.LastName => 'Last'
            };
        }
    }

    public class OpportunityDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Opportunity.Name => 'Test Opportunity',
                    Opportunity.StageName => 'Closed Won',
                    Opportunity.CloseDate => System.today()
            };
        }
    }

    public class CaseDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Case.Subject => 'Test Case'
            };
        }
    }

    public class CouponDefaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Coupon__c.Name => Constants.CUSTOMER_STATUS_SILVER, 
                    Coupon__c.Value__c => 10,
                    Coupon__c.Start_Date__c => Datetime.Now(),
                    Coupon__c.End_Date__c => Datetime.Now().addYears(1)                    
            };
        }
    }

    public class Product2Defaults implements TestFactory.FieldDefaults {
        public Map<Schema.SObjectField, Object> getFieldDefaults() {
            return new Map<Schema.SObjectField, Object> {
                    Product2.Name => 'Test Product',
                    Product2.Category__c => 'Casual',
                    Product2.Material__c => 'Leather',
                    Product2.Construction__c => 'Low',
                    Product2.Picture_URL__c => 'xd.pl'
            };
        }
    }
}
