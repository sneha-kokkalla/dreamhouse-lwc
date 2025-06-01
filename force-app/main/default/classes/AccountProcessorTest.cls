@isTest
private without sharing class AccountProcessorTest {
@isTest
    private static void countContactsTest(){
        //Load test data
        List<Account> accounts= new List<Account>();
        for(Integer i=0; i<300; i++){
            accounts.add(new Account(Name='TestAccount'+i));
        }
        insert accounts;
        List<Contact> contacts= new List<Contact>();
        List<Id> accids = new List<Id>();
        for(Account acc: accounts){
            Contacts.add(new Contact(FirstName=acc.Name,LastName='TestLast',AccountId=acc.Id));
        	accids.add(acc.Id);
        }
        insert contacts; 
        
        //start test
        Test.startTest();
        AccountProcessor.countContacts(accids);
        //stop test
        Test.stopTest();
        //check result
        List<Account> accountlist = [Select Id, Number_Of_Contacts__c from Account];
        for(Account acc:accountlist)
        System.assertEquals(1,acc.Number_Of_Contacts__c, 'ERROR: error is occured');
    }
}