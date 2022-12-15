@IsTest
private class ContactTriggerHandlerTest {
  
    @IsTest
    private static void shouldCountContactsConnectedToAccount(){               
        Account testAccount = new Account(Name = 'TestName');
        Account acc = new Account(Name = 'a');
        Contact testContact = new Contact(Lastname = 'Test', AccountId = testAccount.Id);
        insert testAccount;
        insert acc;
        List<Account> accs = TestSelector.getAccountsContactCount();
        
        Test.startTest();        
        insert testContact;              
        Test.stopTest();      

        List<Account> updatedAccs = TestSelector.getAccountsByPositiveContactCount();
        System.assertNotEquals(accs.size(), updatedAccs.size(), 'testAccount contact count should not be equal to acc contact count.');        
    }
    @IsTest 
    private static void shouldNotCountContactsConnectedToAccount(){
        Account testAccount = new Account(Name = 'TestAccount');
        Contact testContact = new Contact(LastName = 'Test');
        List<Account> accs = TestSelector.getAccountsByPositiveContactCount();
        insert testAccount;
        
        Test.startTest();
        insert testContact;
        Test.StopTest();
        
        List<Account> updatedAccs = TestSelector.getAccountsByPositiveContactCount();
        System.assertEquals(accs.size(), updatedAccs.size(), 'testAccount Contact Count should remain the same.');

    }
}
