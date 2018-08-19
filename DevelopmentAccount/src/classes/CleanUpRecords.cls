global class CleanUpRecords implements Database.Batchable<sObject> {
    
    global final String query;
    
    global CleanUpRecords(String q) {
        query = q;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(
    			Database.BatchableContext BC,
        		List<sObject> scope) {
            delete scope;
            Database.emptyRecycleBin(scope);
        }
    
    global void finish(Database.BatchableContext BC) {
        AsyncApexJob a =
            [SELECT Id,Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob WHERE Id = :BC.getJobId()];
        
        //Send an email to the apex job's submitter
        // notifying of job completion.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
        	mail.setSubject('Record Clean up Status: ' + a.Status);
        	mail.setPlainTextBody
                ('The batch apex job processed ' + a.TotalJobItems + 'batches with' + a.NumberOfErrors + 'failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }

}