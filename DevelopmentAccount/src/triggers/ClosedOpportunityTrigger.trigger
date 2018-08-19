trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List <Task> oppList = new List <Task>();
    for (Opportunity opp :Trigger.New) {
        if(opp.StageName == 'Closed Won') {
            oppList.add(new Task(Subject = 'Follow up Test Task',
                                 WhatId =opp.AccountId));
        }

    }
    if (oppList.size() > 0){
        insert opplist;
    }
}