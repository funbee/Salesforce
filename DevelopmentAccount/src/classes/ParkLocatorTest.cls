@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String x = 'Japan';
        String [] expectedResult = ParkLocator.country(x);
        String[] actualResult =  new List<String> {'Tokyo','Okinawa','Yokohama'};
        // Verify that a fake result is returned
  		System.assertEquals(expectedResult, actualResult); 
       
 		ParkLocator bc = new  ParkLocator();
        bc.did();

    }
}