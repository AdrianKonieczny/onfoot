@IsTest
private class ContactTriggerHandlerTest {
    
    private static String accName = 'testAccount';
    private static String accSecondName = 'testSecondAccount';
    private static String ctName = 'testCt';
    private static String ctSecondName = 'testCtSecond';
    

    @TestSetup
    static void makeData(){ 
        Account testAccount = (Account)TestFactory.createSObject(new Account(Name = accName), TestFactoryDefaults.AccountDefaults.class.toString(), true);    
        Account testAccountSecond = (Account)TestFactory.createSObject(new Account(Name = accSecondName), TestFactoryDefaults.AccountDefaults.class.toString(), true);      
        Contact testCt = (Contact)TestFactory.createSObject(new Contact(Lastname = ctName), TestFactoryDefaults.ContactDefaults.class.toString(), true);
        Contact testCtSecond = (Contact)TestFactory.createSObject(new Contact(Lastname = ctSecondName), TestFactoryDefaults.ContactDefaults.class.toString(), true);
    }

    @IsTest 
    private static void shouldCountContactsRelatedToAccountOnInsert(){
    Account testAccount = TestSelector.getAccountContactCountByName(accName);
    Contact tstCt = (Contact)TestFactory.createSObject(new Contact(AccountId = testAccount.Id));
    Contact tstCtSecond = (Contact)TestFactory.createSObject(new Contact(AccountId = testAccount.Id));  
    
    Test.startTest();   
    insert tstCt;
    insert tstCtSecond;
    Test.stopTest(); 
    
    List<Contact> cts = TestSelector.getContactsByAccountId(new List<Id>{testAccount.Id});
    Account updatedTestAccount = TestSelector.getAccountContactCountByName(accName);

    System.assertEquals(cts.size(), updatedTestAccount.Contact_Count__c, 'cts size should be the same as test account contact count');   
    }

    @IsTest
    private static void shouldCountContactsRelatedToAccountOnUpdate(){               
        Account testAccount = TestSelector.getAccountContactCountByName(accName); 
        Contact testCt = TestSelector.getContactByLastname(ctName);
        Contact testCtSecond = TestSelector.getContactByLastname(ctSecondName);

        testCt.AccountId = testAccount.Id;
        testCtSecond.AccountId = testAccount.Id;
        
        Test.startTest();   
        update testCt;
        update testCtSecond;
        Test.stopTest();      

        List<Contact> cts = TestSelector.getContacts();
        Account updatedTestAccount = TestSelector.getAccountContactCountByName(accName);
        System.assertEquals(cts.size(), updatedTestAccount.Contact_Count__c, 'cts size should be the same as updated test account contact count');        
    }

    @IsTest 
    private static void shouldNotCountContactsRelatedToAccount(){
        Contact testCt = TestSelector.getContactByLastname(ctName);
        Contact testSecondCt = TestSelector.getContactByLastname(ctSecondName);        
        Account testAccount = TestSelector.getAccountContactCountByName(accName); 
        Account testSecondAccount = TestSelector.getAccountContactCountByName(accSecondName); 
           
        testCt.AccountId = testAccount.Id;
        testSecondCt.AccountId = testAccount.Id;   

        Test.startTest();
        update testCt;
        update testSecondCt;
        Test.StopTest();
        
        Account updatedTestAccount = TestSelector.getAccountContactCountByName(accName);
        Account updatedTestSecondAccount = TestSelector.getAccountContactCountByName(accSecondName);
        System.assertEquals(updatedTestAccount.Contact_Count__c, updatedTestSecondAccount.Contact_Count__c + 2, 'Updated test account contact count should not be 0 and updated test second account contact count should be 0.');
    }
}
