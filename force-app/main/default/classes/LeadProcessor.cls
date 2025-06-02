public without sharing class LeadProcessor implements Database.Batchable<sObject> {
    // instance member to retain state across transactions
    public Database.QueryLocator start(Database.BatchableContext dbc) {
        // return a query locator for the records to be processed
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    public void execute(Database.BatchableContext dbc, List<Lead> leads) {
        // process each batch of records
        for (Lead l : leads) {
            
            l.LeadSource = 'Dreamforce';
        }
        // update the processed records
        update leads;
    }
    public void finish(Database.BatchableContext dbc) {
        // optional: perform any final operations after all batches are processed
        System.debug('All leads have been processed.');
    }   
    
}