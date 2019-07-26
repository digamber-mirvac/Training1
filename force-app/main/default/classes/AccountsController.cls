public without sharing class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
    }
    
    @AuraEnabled
    public static List <Case_Backup__b> getCaseBackup(String accountId) {
        System.debug('accountId:-->' + accountId);
        return [select Id, Account__c, Case_Number__c, Description__c, Subject__c from Case_Backup__b WHERE Account__c = : Id.valueOf(accountId)];
    }
	
    @AuraEnabled
    public static List <ContentDocumentLink> getContentDocumentLink() {
        return [SELECT ContentDocumentId,Id,LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId = '0010b00002MT2neAAD'];
    }
    
    @AuraEnabled
    public static String delContentDocumentLink(String docId) {
        String res = 'success';
        delete [SELECT Id FROM ContentDocument WHERE Id =: Id.valueOf(docId)];
        //delete [SELECT Id FROM ContentDocument WHERE Id ='0690b000004xqOYAAY'];
        return res;
    }
}