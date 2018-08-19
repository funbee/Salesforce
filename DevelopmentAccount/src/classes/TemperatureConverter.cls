public class TemperatureConverter {
    //Takes a Farenheit temperature and returns the Celcius equivalent
    public static Decimal FarenheitToCelcius(Decimal fh)   {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }

}