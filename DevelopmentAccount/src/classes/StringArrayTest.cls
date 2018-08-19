public class StringArrayTest {
 
    public static String[] generateStringArray(integer testLen) {
       
        String[] myArray = new List<String>();
            
            for(Integer i=0;i< testLen;i++) {
                    myArray.add('Test ' +i);          
                    System.debug(myArray[i]);
            } 
            return myArray;
        }   
}