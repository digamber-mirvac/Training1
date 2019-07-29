public with sharing class LeadTriggerHandler {
    public LeadTriggerHandler() {

    }

    public static void afterInsert(Map<Id, Lead> mapLead) {
        System.debug('Inside afterInsert...');
    }
}
