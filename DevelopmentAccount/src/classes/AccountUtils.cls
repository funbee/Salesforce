public class AccountUtils {
    public static List <Account> accountsBystate(String stateName) {
        
        

        List<Account> myAccounts = [SELECT Id,Name,BillingState  FROM Account where BillingState =:stateName];
        
        return myAccounts;
        
       
    }
}