public class NewCaseListController {
    
     private String sortOrder = 'CaseNumber';
    
    public List<Case> getNewCases() {
     
    List<Case> results = [SELECT Id,CaseNumber FROM Case WHERE Status = 'New'];
    return results;
}
    

}