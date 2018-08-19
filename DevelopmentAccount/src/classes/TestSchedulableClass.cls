@isTest
private class TestSchedulableClass {

//CRON expression: midnight on June 15.
//Because this is a test, job executes
//immediatedly after Test.stopTest().
public static String CRON_EXP = '0 0 0 15 6 ? 2022';

static testmethod void test() {
  Test.startTest();
  
  //Schedule the test job
  String jobId = System.schedule('ScheduleApexClassTest', CRON_EXP, new MySchedulableClass());
  
  //Get the information from the CronTrigger API object
  CronTrigger ct = [SELECT Id,CronExpression, TimesTriggered,NextFireTime 
                    FROM CronTrigger WHERE Id = :jobId];
                    
  //Verify the expressions are the same
  System.assertEquals(CRON_EXP, ct.CronEXpression);
  
  //Verify the job has not run
  System.AssertEquals(0, ct.TimesTriggered);
  
  //Verify the next time the job will run
  System.assertEquals('2022-06-15 00:00:00', String.valueOf(ct.NextFireTime));
  
  //Verify the scheduled job hasn't run yet
  Merchandise__c[] ml = [SELECT Id FROM Merchandise__c WHERE Name = 'Scheduled Job Item'];
  System.assertEquals(ml.size(),0);
  Test.stopTest();
  
  //Now that the scheduled test has executed after test.stopTest(),
  //fetch the merchandise that got added.
  ml = [SELECT Id FROM Merchandise__c WHERE Name = 'Scheduled Job Item'];
  System.assertEquals(ml.size(),1);
  
  }
  }