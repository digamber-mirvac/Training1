public with sharing class CaseService {
    
    public static void closeCases (Set<Id> caseIds, String closeReason) {
        
        if(caseIds != null && caseIds.size() > 0){
            List<Case> caseToUpdate = [Select Id, Status, Reason from Case where Id in: caseIds];
            
            for(Case c : caseToUpdate){
                c.Status = 'Closed';
                c.Reason = closeReason;
            }
            
            update caseToUpdate;
        }
        
    }

}