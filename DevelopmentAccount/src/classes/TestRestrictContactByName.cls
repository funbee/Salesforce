@isTest
private class TestRestrictContactByName {
    @isTest static void TestInsertContactWithInvalidName() {
        //Test Data Setuphttps://eu5.salesforce.com/_ui/common/apex/debug/ApexCSIPage#
        //Create contact with invalid name and then try to insert it
        Contact c = new Contact(LastName = 'INVALIDNAME');
        insert c;
        
        //perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertNotEquals('The Last Name "'+c.LastName+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }

    
     @isTest static void TestUpdateContactWithInvalidName() {
        //Test Data Setup
        //Create contact with invalid name and then try to insert it
        Contact c = new Contact(LastName  = 'John ');
        insert c;
         c.LastName = 'INVALIDNAME';
         update c;
       
        //perform test
        Test.startTest();
        Database.SaveResult result = Database.update(c, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertEquals('The Last Name "'+c.LastName+'" is not allowed for DML', result.getErrors()[0].getMessage());
    }
    
   
    
}