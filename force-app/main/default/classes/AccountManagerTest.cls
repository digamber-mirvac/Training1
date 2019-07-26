@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://login.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name='Test Account');
        insert accountTest;
        Contact contactTest = new Contact (AccountId=accountTest.Id, FirstName='Test', LastName='Contact');
		insert contactTest;

        return accountTest.Id;
    }  
}