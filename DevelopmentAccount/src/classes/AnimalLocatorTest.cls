@isTest
private class AnimalLocatorTest {
    @isTest static void AnimalLocatorMock1() {
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalById');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
         Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        // Call method to test
   String result = AnimalLocator.getAnimalNameById(1);
          system.debug(result);
        String expectedResult = 'lion';
        System.assertEquals(result,expectedResult );

        // Verify mock response is not null
        System.assertNotEquals(null,result,
            'The callout returned a null response.');
    }
}