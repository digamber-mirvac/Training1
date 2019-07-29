trigger LeadTrigger on Lead (after insert) {
    System.debug('Changes as part of new feature...');
    LeadTriggerHandler.afterInsert(trigger.newMap);
}