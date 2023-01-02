@IsTest
private class ContactTriggerHandlerTest {
  
    @TestSetup
    static void makeData(){ 
        Account testAccount = new Account(Name = 'testAccount');
        insert testAccount;
        Contact testCt = new Contact(Lastname = 'testCt', AccountId = testAccount.Id);
        Contact testCtSecond = new Contact(Lastname = 'testCtSecond', AccountId = testAccount.Id); 
        insert testCt;
        insert testCtSecond; 
    }

    @IsTest
    private static void shouldCountContactsRelatedToAccount(){               
        Account testAccount = [SELECT Id, Name FROM Account WHERE Name = 'testAccount']; 
        Contact testCt = [SELECT Id, Name, AccountId FROM Contact WHERE Lastname = 'testCt'];
        Contact testCtSecond = [SELECT Id, Name, AccountId FROM Contact WHERE Lastname = 'testCtSecond'];
        
        Test.startTest();   
        update testCt;
        update testCtSecond;
        Test.stopTest();      

        List<Contact> cts = [SELECT Id FROM Contact];
        Account updatedTestAccount = [SELECT Id, Name, Contact_Count__c FROM Account WHERE Name = 'testAccount'];
        System.assertEquals(cts.size(), updatedTestAccount.Contact_Count__c, 'testAccount contact count should not be equal to acc contact count.');        
    }

    @IsTest 
    private static void shouldNotCountContactsRelatedToAccount(){
        Account testAccount = new Account(Name = 'TestAccount');
        Contact testContact = new Contact(LastName = 'Test');
        List<Account> accs = [SELECT Id, Contact_Count__c FROM Account];
        insert testAccount;
        
        Test.startTest();
        insert testContact;
        Test.StopTest();
        
        List<Account> updatedAccs = [SELECT Id, Contact_Count__c FROM Account];
        System.assertEquals(accs.size(), updatedAccs.size(), 'testAccount Contact Count should remain the same.');

    }
}
