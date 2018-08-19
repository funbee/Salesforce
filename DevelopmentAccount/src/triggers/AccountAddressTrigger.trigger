trigger AccountAddressTrigger on Account (before insert, before update) {
    
    List<Account> accList = [SELECT Id,Match_Billing_Address__c,ShippingPostalCode FROM Account];
    for (Account a  : Trigger.New)  {
        if(a.Match_Billing_Address__c == true && a.BillingPostalCode != null)  {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
   
}