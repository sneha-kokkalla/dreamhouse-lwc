@isTest
private class LeadProcessorTest {
    
    @isTest
    private static void testBatchClass() {
        
        // Load test data
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<300; i++) {
            leads.add(new Lead(LastName='Connock', Company='Salesforce'));
        }
        insert leads;
        
        // Perform the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();
        
        // Check the result
        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(300, updatedLeads.size(), 'ERROR: At least 1 Lead record not updated correctly');
    }
}