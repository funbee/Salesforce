@isTest
private class VerifyDateTest {
    @isTest static void testCheckDates()  {
        Date firstDate = Date.newInstance(2016,04,11);
        Date secondDate = Date.newInstance( 2016,04,16);
        Date tested = VerifyDate.CheckDates(firstDate,secondDate);
        System.assertEquals(tested , secondDate);
    }

     @isTest static void testOutOfRangeDates()  {
        Date firstDate = Date.newInstance(2016,04,11);
        Date secondDate = Date.newInstance( 2016,06,16);
        Date tested1 = VerifyDate.CheckDates(firstDate,secondDate);
        Date endofMonth = Date.newInstance(2016, 04, 31);
         System.assertEquals(endofMonth, tested1);
  
    }

    
    
}