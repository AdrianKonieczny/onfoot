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
        List<Case> cases = TestSelector.getCases();

        Test.startTest();
        insert testCase;
        Test.stopTest();

        List<Case> updatedCases = TestSelector.getCases();      
        System.assertEquals(cases.size()+1, updatedCases.size(), 'case should be created');
    }

    @IsTest
    private static void shouldNotCreateCase(){
        Case testCase = new Case(Status = Constants.STATUS_NEW, Origin = Constants.ORIGIN_PHONE, Security_Code__c = 'X455');

        Test.startTest();
        try{                                   
            insert testCase; 
        }
        catch(Exception ex){
            ex.getMessage();      
        }
        Test.stopTest();

        System.assertEquals(testCase.Id, null, 'case should not be created, wrong security code');
    }

    @IsTest
    private static void shouldUpdateCase(){              
        Case testCase = TestSelector.getCaseBySecurityCode(new List<String>{Constants.SECURITY_CODE_NY});
        Case testCaseSecond = TestSelector.getCaseBySecurityCode(new List<String>{Constants.SECURITY_CODE_CA});
        
        testCase.Security_Code__c = Constants.SECURITY_CODE_CA;

        Test.startTest();
        update testCase;
        Test.stopTest();
        
        System.assertEquals(testCase.Security_Code__c, testCaseSecond.Security_Code__c, 'tst case should be updated');
    }
}