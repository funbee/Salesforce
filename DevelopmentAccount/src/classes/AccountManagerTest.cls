@IsTest
private class AccountManagerTest {

    private static testMethod void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://eu5.salesforce.com/services/apexrest/Accounts/'+ recordId +'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }

   
   
 
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(
            Name='Test record');
        insert AccountTest;
        Contact ContactTest = new Contact(
        FirstName = 'My',
        LastName = 'Test',
        AccountId = AccountTest.id);
        System.debug(AccountTest.id);
       
        return AccountTest.Id;
    }          
}