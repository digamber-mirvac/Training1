@isTest
private class UnitOfWorkTest {
    
    static testMethod void challengeComplete (){
        
        // Create a Unit Of Work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
        
        for(integer i=0; i<100; i++){
            
            Account acct = new Account();
            
            acct.Name = 'Test Account ' + i;
            
            uow.registerNew(acct);
            
            for(integer j=0; j<5; j++){
                Contact cont = new Contact();
                
                cont.LastName = 'Last' + i + j;
                uow.registerNew(cont, Contact.AccountId, acct);
                
                Note nt = new Note();
                
                nt.Title = 'Note' + i + j;
                nt.Body = 'Note' + i + j;
                uow.registerNew(nt, Note.ParentId, acct);
            }
            
        }
        
        uow.commitWork();
        
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());

    }

}