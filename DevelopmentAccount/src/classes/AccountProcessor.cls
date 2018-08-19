global class AccountProcessor {
  @future
  public static void countContacts(List<Id>  recordIds) {
      
    List<Account> acct = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = : recordIds];
   
      for(Account acc : acct){
          List<Contact> taskContact = acc.contacts ;
          acc.Number_of_Contacts__c = taskContact.size();
  }
      update acct;
}
}