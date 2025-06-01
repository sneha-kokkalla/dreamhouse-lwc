public class AccountProcessor {
  @future
  public static void countContacts(List<Id> recordIds) {
    List<Account> accounts = [Select Id, (SELECT Id FROM Contacts) from Account Where Id IN :recordIds];
    for(Account acc:accounts)
            acc.Number_Of_Contacts__c=acc.Contacts.size();
    Update accounts;
  }
}