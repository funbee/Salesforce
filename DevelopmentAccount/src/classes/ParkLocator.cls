public class ParkLocator {
    public static String[] country(String chosenCountry) {
        ParkService.ParksImplPort park = 
            new ParkService.ParksImplPort();
        System.debug(chosenCountry);
          return park.byCountry(chosenCountry);
    }
    
    public void did()
 {
    string chosenCountry='Japan';
   //  gt=theCountry;
     ParkService.ParksImplPort park = new ParkService.ParksImplPort();
     park.byCountry(chosenCountry);
 ParkService.byCountryResponse response_x= new ParkService.byCountryResponse(); 

   
       
 }
}