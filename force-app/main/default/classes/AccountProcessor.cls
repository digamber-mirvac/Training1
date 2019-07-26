global class AccountProcessor {
    @future(callout=true)
    public static void countContacts (List<Id> accountIds){
        List<Account> accounts = new List<Account>();
        if(accountIds.size() > 0){
            List<AggregateResult> groupedResults  = [SELECT Accountid, COUNT(Id) Total from Contact where AccountId IN: accountIds GROUP BY AccountId];

            for(AggregateResult ar : groupedResults){
                accounts.add(new Account(Id=(Id)ar.get('AccountId'), Number_of_Contacts__c=(Integer)ar.get('Total')));
            }
        }
        
        if(accounts.size() > 0)
            update accounts;
    }

}