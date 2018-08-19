public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String lName){
      
        List<List<SObject>> searchedList = [FIND :lName IN ALL FIELDS RETURNING LEAD(LastName WHERE LastName = :lName)
                                            ,Contact(Lastname WHERE LastName =:lName)];
         return searchedList;
    }

}