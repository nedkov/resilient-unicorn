/**
 * Created by nedko.nedkov on 4.06.24.
 */

public with sharing class CaseService {

    public static void closeCases(Set<Id> caseIds, String closeReason){
        // Query the cases that need to be closed
        List<Case> casesToUpdate = [SELECT Id, Status, Reason FROM Case WHERE Id IN :caseIds];

        // Update the cases
        for (Case c : casesToUpdate) {
            c.Status = 'Closed';
            c.Reason = closeReason;
        }

        // Bulk update
        update casesToUpdate;
    }
}