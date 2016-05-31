public class Webservicescallout {
		public string Body;
 	    Public String ID;
      	public void getInfo(String QueryID){	
         	ID = QueryID;
          List<CustomEmailObj__c> CusEmail=new List<CustomEmailObj__c>([SELECT id, BodyTxt__c,SubjectTxt__c FROM CustomEmailObj__c where id =:ID]);
          system.debug('2@@'+CusEmail);
          String url = 'http://google.com/#q=';
        for(CustomEmailObj__c C : CusEmail){
		Body=C.BodyTxt__c;   
        System.debug('333'+Body);
        }
        Body= EncodingUtil.urlEncode(Body, 'UTF-8');
        // build callout
        url += Body; 
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setTimeout(60000);
        system.debug('!2222'+req);
        
        HttpResponse res = h.send(req);
        
       Integer statusCode = res.getStatusCode();
 system.debug('!1111'+statusCode);
       String statusName = res.getStatus();
 system.debug('!33333'+statusName);
        system.debug('!33333'+res.getBody());
      }
}