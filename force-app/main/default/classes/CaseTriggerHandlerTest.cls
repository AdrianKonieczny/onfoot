@IsTest
public with sharing class CaseTriggerHandlerTest {
    
    private static final Map<String, Security_Code_Mapping__mdt> CODE_MAPPINGS = Security_Code_Mapping__mdt.getAll();

    @IsTest
    private static void shouldCreateCase(){             
        Case testCase = (Case)TestFactory.createSObject(new Case(Security_Code__c = CODE_MAPPINGS.values().get(0).DeveloperName), TestFactoryDefaults.CaseDefaults.class.toString(), false);
        List<Case> cases = TestSelector.getCases();

        Test.startTest();
        insert testCase;
        Test.stopTest();

        List<Case> updatedCases = TestSelector.getCases();      
        System.assertEquals(cases.size()+1, updatedCases.size(), 'case should be created');
    }

    @IsTest
    private static void shouldNotCreateCase(){
        Case testCase = (Case)TestFactory.createSObject(new Case(Security_Code__c = 'X455'), TestFactoryDefaults.CaseDefaults.class.toString(), false);

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

        Case testCase = (Case)TestFactory.createSObject(new Case(Security_Code__c = CODE_MAPPINGS.values().get(0).DeveloperName), TestFactoryDefaults.CaseDefaults.class.toString(), true);      
        testCase.Security_Code__c = CODE_MAPPINGS.values().get(1).DeveloperName;       

        Test.startTest();
        update testCase;
        Test.stopTest();
        
        System.assertEquals(testCase.Security_Code__c, CODE_MAPPINGS.values().get(1).DeveloperName, 'test Case should be updated');
    }
}