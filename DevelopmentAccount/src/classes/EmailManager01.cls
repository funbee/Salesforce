public class EmailManager01 {
    
    // public method
    public static void sendMail(String address ,String subject, String body)
    {
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //Pass this email message to the built in SendEmail method
        //of the messsaging class
        Messaging.SendEmailResult[] results = Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
        
        // call a helper method to inspect the returned results
        inspectResults(results);   
    }
    
    //helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendresult = true;
        
        //sendEmail returns an array of result objects.
        //iterate through the list to inspect results.
        //in this class, the methods send only one email.
        //so we should have only one result.
        for (Messaging.SendEmailResult res :  results) {
            if(res.isSuccess())  {
                System.debug('Email sent successfully');
            }
            else  {
                sendResult = false;
                System.debug('the following errrors occured:' + res.getErrors());
            }
        }
        return sendResult;
    }

}