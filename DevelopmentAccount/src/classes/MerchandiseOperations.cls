public class MerchandiseOperations {
    public static Id invoice( String pName, Integer pQuantity, string pDesc)  {
        // Retrieve the pencil sample merchandise
        Merchandise__c m = [SELECT Price__c,Quantity__c FROM Merchandise__c WHERE Name =:pName LIMIT 1];
        //break if no merchandise is found
        System.assertNotEquals(null,m);
        //add a new invoice
        Invoice__c i = new invoice__c(
        Description__c = pDesc);
        insert i;
        
        //add a new line item to the invoice
        Line_item__c li = new line_item__c(
        Name = '1',
        Invoice__c = i.Id,
        Merchandise__c = m.Id,
        Unit_P__c = m.Price__c,
        Quantity__c = pQuantity);
        
        insert li;
        
        //update the inventory of the merchandise Item
        m.Quantity__c -= pQuantity; 
        update m;
        return i.Id;
        
    }

}