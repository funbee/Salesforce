@IsTest
private class AccountProcessorTest {

  @IsTest
  private static void testCountContacts() {
   Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont1 = New Contact();
        cont1.FirstName ='Bob';
        cont1.LastName ='Jay';
        cont1.AccountId = a.Id;
        Insert cont1;
      
       Account b = new Account();
        b.Name = 'Test Account';
        Insert b;

        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Jay';
        cont.AccountId = a.Id;
        Insert cont;
        
        List<Id> setAccId = new List<ID>();
        setAccId.add(a.id);
      	setAccId.add(b.id);
 
        Test.startTest();
            AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account ACC = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 2];
        System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,2);
    	System.assertEquals(1, setAccId.size());
 
  }

}