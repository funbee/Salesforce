public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        List<Account> createdAccts = new List <Account> ();
         for (Account a : accts) {
           
             if(a.ShippingState !=  a.BillingState){
                 a.ShippingState = a.BillingState;
             } 
            createdAccts.add(a);
        } 
      
           
    }
}