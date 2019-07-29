trigger LeadTrigger on Lead (after insert) {
    LeadTriggerHandler.afterInsert(trigger.newMap);
}