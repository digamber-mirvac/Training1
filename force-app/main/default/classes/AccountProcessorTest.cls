@IsTest
private class AccountProcessorTest {
  @isTest
  static void testAccountProcessor() {
    Id accountId = createTestRecord();
    Test.startTest();
      AccountProcessor.countContacts(new List<Id>{accountId});
    Test.stopTest();
    //System.assertEquals(1, logs.size());
    //System.assertEquals('success', logs[0].msg__c);
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