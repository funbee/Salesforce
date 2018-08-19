public class AccountHandler {
    public static Account insertNewAccount(String accName){
        Account acct = new Account(Name = accName);
        try{
            insert acct;
        } catch (DmlException e ) {
            System.debug('An excption has occured' + e.getMessage());
            return null;
        }
        return acct;
    }

}