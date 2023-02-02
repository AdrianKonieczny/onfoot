@IsTest
public with sharing class CaseTriggerHandlerTest {
    
    private static final Map<String, Security_Code_Mapping__mdt> CODE_MAPPINGS = Security_Code_Mapping__mdt.getAll();

    @IsTest
    private static void shouldCreateCase(){             
        Case testCase = (Case)TestFactory.createSObject(new Case(Security_Code__c = CODE_MAPPINGS.values().get(0).DeveloperName), TestFactoryDefaults.CaseDefaults.class.toString(), false);
        
        Test.startTest();
        insert testCase;
        Test.stopTest();

        Case updatedCase = TestSelector.getCases().get(0);
    
        System.assertNotEquals(testCase.Id, null, 'case should be created');
        System.assertEquals(updatedCase.State__c, CODE_MAPPINGS.values().get(0).State__c, 'State should be updated');
    }

    @IsTest
    private static void shouldNotCreateCase(){
        String wrongCode = 'incorrect';
        Case testCase = (Case)TestFactory.createSObject(new Case(Security_Code__c = wrongCode), TestFactoryDefaults.CaseDefaults.class.toString(), false);
        String exMessage; 

        Test.startTest();
        try{                                   
            insert testCase; 
        }
        catch(Exception ex){
            exMessage = ex.getMessage();    
        }
        Test.stopTest();

        System.assertEquals(testCase.Id, null, 'case should not be created, wrong security code');
        System.assert(exMessage.contains(CaseTriggerHandler.SECURITY_CODE_ERROR_MESSAGE), 'Correct message should be displayed');
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