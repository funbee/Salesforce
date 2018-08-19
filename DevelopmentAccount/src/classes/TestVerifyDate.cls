@isTest
public class TestVerifyDate {
     @isTest static void testCheckDates()  {
        Date firstDate = Date.newInstance(2016,04,11);
        Date secondDate = Date.newInstance( 2016,04,16);
        Date tested = VerifyDate.CheckDates(firstDate,secondDate);
        System.assertEquals(tested , secondDate);
    }

     @isTest static void testOutOfRangeDates()  {
        Date firstDate = Date.newInstance(2016,04,11);
        Date secondDate = Date.newInstance( 2016,05,12);
        Date tested1 = VerifyDate.CheckDates(firstDate,secondDate);
         Date x = Date.newInstance(2016,04,31);
        System.assertEquals(x, tested1);
     }

}