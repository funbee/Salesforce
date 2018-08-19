public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer contactNum, String lName) {
        
        List<Contact> cts = new List<Contact> ();
        for(Integer i = 0; i<contactNum; i++) {
            Contact c = new Contact(FirstName = 'Test' + i,
                                   LastName = lName);
            
            cts.add(c);
        }
        return cts;
    }

}