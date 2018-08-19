@isTest
private class TemperatureConverterTest {
    
    @isTest static void testWarmTemprature()  {
        Decimal celcius = TemperatureConverter.FarenheitToCelcius(70);
        System.assertEquals(21.11,celcius);
    }
    
    @isTest static void testFreezingPoint()    {
         Decimal celcius = TemperatureConverter.FarenheitToCelcius(32);
        System.assertEquals(0,celcius);
    }
    
    @isTest static void testBoilingPoint()     {
         Decimal celcius = TemperatureConverter.FarenheitToCelcius(212);
        System.assertEquals(100,celcius,'Boiling Point Temperature is not expected');
    }
    
    @isTest static void testNegativeTemperature() {
       Decimal celcius = TemperatureConverter.FarenheitToCelcius(-10);
        System.assertEquals(-23.33,celcius); 
    }

}