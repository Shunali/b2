public class relatedRecordsController{

private final List<DetailRecord__c> DetRec;

    public relatedRecordsController() {
        DetRec = [Select d.Title__c,d.Link__c, d.Snippet__c, d.RelatedLink__c From DetailRecord__c d where d.CreatedDate = TODAY];
    }
    
    public List<DetailRecord__c> getrelatedRecords() {
        return DetRec;
    }


}