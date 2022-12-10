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
}
