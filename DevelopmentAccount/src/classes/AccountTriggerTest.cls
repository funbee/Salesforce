@isTest
public class AccountTriggerTest {
    @isTest static void TestCreateNewAccounts() {
        // Test Setup data
        // Create 200 new Accounts

        List<Account> accts = new List<Account>();

        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account' + i,
                                       BillingState = 'CA');
            
          accts.add(acct);
            
         }

        // Perform Test
        Test.startTest();
        insert accts;
        Test.stopTest();
        
      List<Account> verifyAcc = [SELECT Id FROM Account];
      System.assertEquals(200, verifyAcc.size());  

       
       List<Account> AnAccount = [SELECT ShippingState FROM Account];
            for (Account a: AnAccount ){
                System.assertEquals('CA', a.ShippingState, 'ERROR');
            }
        
   
        
    }  
}