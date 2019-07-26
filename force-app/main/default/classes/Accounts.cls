public class Accounts extends fflib_SObjectDomain {
	
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    
    public override void onApplyDefaults () {
        //super.onApplyDefaults();
        for(Account acct : (List<Account>) Records) {
            acct.Description = 'Domain classes rock!';
        }
        
    }
    
    public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
        
        for(Account acct : (List<Account>) Records) {
            
            //Account existingAcct = (Account) existingRecords.get(acct.Id);
            
            //Integer levenshteinDistance = 0;
            String domainClasses = 'Domain classes rock!';
            
            acct.AnnualRevenue = domainClasses.getLevenshteinDistance(acct.Description);
        }
        
    }
    
    
}