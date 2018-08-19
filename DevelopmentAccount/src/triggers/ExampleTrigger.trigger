trigger ExampleTrigger on Contact (after insert, after delete) {
    if  (Trigger.isInsert)  {
        Integer recordCount = Trigger.New.size();
        //Call a utility method from another class
        EmailManager.sendMail('funbi2.0@gmail.com','Trailhead Trigger Tutorial',recordCount +' contact(s) were inserted.');
    }
    else if (Trigger.isDelete)  {
        // process after delete
    }
            

}