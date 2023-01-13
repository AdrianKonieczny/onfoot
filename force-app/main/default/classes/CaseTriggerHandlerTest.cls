@IsTest
public with sharing class CaseTriggerHandlerTest {
    
    @TestSetup
    static void makeData(){
        Case tstCase = (Case)TestFactory.createSObject(new Case(Status = 'New', Origin = 'Phone', Security_Code__c = 'X433'), TestFactoryDefaults.CaseDefaults, true);
        insert tstCase;
    }
    @IsTest
    private static void shouldCreateCase(){
        Case testCase = new Case(Status = 'New', Origin = 'Phone', Security_Code__c = 'X442');
        List<Case> cases = [SELECT Id FROM Case];

        Test.startTest();
        insert testCase;
        Test.stopTest();

        List<Case> updatedCases = [SELECT Id FROM Case];      
        System.assertEquals(cases.size() + 1, updatedCases.size(), 'case should be created');
    }

    @IsTest
    private static void shouldNotCreateCase(){
        Case testCase = new Case(Status = 'New', Origin = 'Phone', Security_Code__c = 'X455');
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
    private static void shouldUpdateCreateCase(){       
        Case tstCase = [SELECT Id, Security_Code__c FROM Case];
        tstCase.Security_Code__c = 'X442';

        Test.startTest();
        update tstCase;
        Test.stopTest();

        Case updatedCase = [SELECT Id, Security_Code__c FROM Case];
        System.assertNotEquals(tstCase.Security_Code__c, updatedCase.Security_Code__c, 'tst case should be updated');
    }
}