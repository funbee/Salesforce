public class Fridge implements KitchenUtility {
    private String modelNumber = 'XX-X';
    private Integer numberInStock = 0;
    
    public void updateStock(Integer justSold) {
        numberInStock = numberInStock - justSold;
    }
    public Fridge(String theModelNumber, Integer theNumberInStock){
        modelNumber = theModelNumber;
        numberInStock = theNumberInStock;
    }
    public void setModelNumber(String theModelNumber){
        modelnumber = theModelNumber;
    }
    public String getmodelNumber(){
        return modelNumber;
    }
    public static Integer stockThreshold = 5;
    
    public static void toDebug(Fridge aFridge){
        System.debug('ModelNumber = ' + aFridge.modelNumber);
        System.debug('Number in Stock =' + aFridge.numberInStock);
    }
    
    public Integer ecoRating{
        
        get{ return ecoRating; }
        
        set { ecorating = value; if (ecorating < 0) ecoRating = 0;}
    }
}