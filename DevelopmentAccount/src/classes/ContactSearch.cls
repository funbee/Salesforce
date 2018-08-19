public class ContactSearch {
    public static Contact[] searchForContacts(String lName,String postCode){
        
        Contact[] searchedContacts = [ SELECT Id,Name FROM Contact where mailingPostalCode = :postCode AND LastName= :lName ];
        return searchedContacts;
    }

}