public class AddPrimaryContact implements Queueable {
    
    private Contact pryContacts;
    private String state;
    
    public AddPrimaryContact(Contact theContacts, String theState) {
        this.pryContacts = theContacts;
        this.state = theState;
    }

    public void execute(QueueableContext context) {
         List<Account> LstAccount = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts ) 
                                      FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
         List<Contact> lstContact = new List<Contact>();
         for (Account acc:LstAccount)
         {
                 Contact cont = pryContacts.clone(false,false,false,false);
                 cont.AccountId =  acc.id;
                 lstContact.add( cont );
         }
         
         if(lstContact.size() >0 )
         {
             insert lstContact;
         }
             
    }

}