@IsTest
public with sharing class CaseTriggerHandlerTest {
    
    @TestSetup
    static void makeData(){
        Case tstCase = (Case)TestFactory.createSObject(new Case(Status = Constants.STATUS_NEW, Origin = Constants.ORIGIN_PHONE, Security_Code__c = Constants.SECURITY_CODE_NY), TestFactoryDefaults.CaseDefaults.class.toString(), true);
        Case tstCaseSecond = (Case)TestFactory.createSObject(new Case(Status = Constants.STATUS_NEW, Origin = Constants.ORIGIN_PHONE, Security_Code__c = Constants.SECURITY_CODE_CA), TestFactoryDefaults.CaseDefaults.class.toString(), true);
    }   
    @IsTest
    private static void shouldCreateCase(){
        Case testCase = new Case(Status = Constants.STATUS_NEW, Origin = Constants.ORIGIN_PHONE, Security_Code__c = Constants.SECURITY_CODE_NV);
        List<Case> cases = [SELECT Id FROM Case];

        Test.startTest();
        insert testCase;
        Test.stopTest();

        List<Case> updatedCases = [SELECT Id FROM Case];      
        System.assertEquals(cases.size()+1, updatedCases.size(), 'case should be created');
    }

    @IsTest
    private static void shouldNotCreateCase(){
        Case testCase = new Case(Status = Constants.STATUS_NEW, Origin = Constants.ORIGIN_PHONE, Security_Code__c = 'X455');
        List<Case> cases = [SELECT Id FROM Case];

        Test.startTest();
        try{                                   
            insert testCase; 
        }
        catch(Exception ex){
            ex.getMessage();      
        }
        Test.stopTest();

        List<Case> updatedCases = [SELECT Id FROM Case];
        System.assertEquals(cases.size(), updatedCases.size(), 'case should not be created, wrong security code');
    }

    @IsTest
    private static void shouldUpdateCase(){              
        Case testCase = [SELECT Id, Security_Code__c FROM Case WHERE Security_Code__c = :Constants.SECURITY_CODE_NY LIMIT 1];
        Case testCaseSecond = [SELECT Id, Security_Code__c FROM Case WHERE Security_Code__c = :Constants.SECURITY_CODE_CA LIMIT 1];
        
        testCase.Security_Code__c = Constants.SECURITY_CODE_CA;

        Test.startTest();
        update testCase;
        Test.stopTest();
        
        System.assertEquals(testCase.Security_Code__c, testCaseSecond.Security_Code__c, 'tst case should be updated');
    }
}