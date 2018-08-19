trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity> ();    
    
    //Add an oppportunity for each account if it already doesn't have one.
    //iterate through each account.
    for (Account a: [SELECT Id, Name FROM Account WHERE Id IN :Trigger.New AND
                    Id NOT IN(SELECT AccountId FROM Opportunity)])
    {
        //Add a default opportunity for this account
            oppList.add(new Opportunity(Name=a.Name + 'Opportunity',
                                       StageName = 'Prospecting',
                                       CloseDate = System.today().addMonths(1),
                                       AccountId = a.Id));
        }
        
    if (oppList.size()> 0){
        insert oppList;
    }
}