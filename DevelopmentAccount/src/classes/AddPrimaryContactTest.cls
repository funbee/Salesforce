@isTest
public class AddPrimaryContactTest  {

  static testmethod void testQueueable() {
        List<Account> accounts = new List<Account>();
                // add 50 accounts each
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState = 'NY'));
        }
        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState = 'CA'));
        }
        insert accounts;
         Contact cont = New Contact();
         cont.FirstName ='Bob';
         cont.LastName ='Jay';
        cont.AccountId = accounts[0].Id;
         Insert cont;
        String state = 'CA';
        
        
       AddPrimaryContact updater = new AddPrimaryContact(cont, state);
        // startTest/stopTest block to force async processes to run
        Test.startTest();
    system.enqueueJob(updater);
    test.stopTest();
    }
}