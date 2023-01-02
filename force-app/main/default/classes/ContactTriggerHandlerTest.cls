@IsTest
private class ContactTriggerHandlerTest {
    
    private static String accName = 'testAccount';
    private static String accSecondName = 'testSecondAccount';
    private static String ctName = 'testCt';
    private static String ctSecondName = 'testCtSecond';
    

    @TestSetup
    static void makeData(){ 
        Account testAccount = new Account(Name = accName);    
        Account testAccountSecond = new Account(Name = accSecondName);       
        Contact testCt = new Contact(Lastname = ctName);
        Contact testCtSecond = new Contact(Lastname = ctSecondName);
        insert testAccount;
        insert testAccountSecond; 
        insert testCt;
        insert testCtSecond;   
    }

    @IsTest 
    private static void shouldCountContactsRelatedToAccountOnInsert(){
    Account testAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName];
    
    Contact tstCt = (Contact)TestFactory.createSObject(new Contact(AccountId = testAccount.Id));
    Contact tstCtSecond = (Contact)TestFactory.createSObject(new Contact(AccountId = testAccount.Id));  
    
    Test.startTest();   
    insert tstCt;
    insert tstCtSecond;
    Test.stopTest(); 
    
    List<Contact> cts = [SELECT Id, AccountId FROM Contact WHERE AccountId = :testAccount.Id];
    Account updatedTestAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName];

    System.assertEquals(cts.size(), updatedTestAccount.Contact_Count__c, 'cts size should be the same as test account contact count');   
    }

    @IsTest
    private static void shouldCountContactsRelatedToAccountOnUpdate(){               
        Account testAccount = [SELECT Id FROM Account WHERE Name = :accName]; 
        Contact testCt = [SELECT Id, AccountId FROM Contact WHERE Lastname = :ctName];
        Contact testCtSecond = [SELECT Id, AccountId FROM Contact WHERE Lastname = :ctSecondName];

        testCt.AccountId = testAccount.Id;
        testCtSecond.AccountId = testAccount.Id;
        
        Test.startTest();   
        update testCt;
        update testCtSecond;
        Test.stopTest();      

        List<Contact> cts = TestSelector.getContacts();
        Account updatedTestAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName];
        System.assertEquals(cts.size(), updatedTestAccount.Contact_Count__c, 'cts size should be the same as updated test account contact count');        
    }

    @IsTest 
    private static void shouldNotCountContactsRelatedToAccount(){
        Contact testCt = [SELECT Id, AccountId FROM Contact WHERE Lastname = :ctName];
        Contact testSecondCt = [SELECT Id, AccountId FROM Contact WHERE Lastname = :ctSecondName];        
        Account testAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName]; 
        Account testSecondAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accSecondName]; 
           
        testCt.AccountId = testAccount.Id;
        testSecondCt.AccountId = testAccount.Id;   

        Test.startTest();
        update testCt;
        update testSecondCt;
        Test.StopTest();
        
        Account updatedTestAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accName];
        Account updatedTestSecondAccount = [SELECT Id, Contact_Count__c FROM Account WHERE Name = :accSecondName];
        System.assertNotEquals(updatedTestAccount.Contact_Count__c, updatedTestSecondAccount.Contact_Count__c, 'Updated test account contact count should not be 0 and updated test second account contact count should be 0.');
    }
}
