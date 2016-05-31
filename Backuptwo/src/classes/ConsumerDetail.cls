public class ConsumerDetail{
    public String accesstoken;
    public String instanceUrl;
    public void login(){
    
        String clientId ='3MVG9ZL0ppGP5UrD6PtYtPHJfemaAe46LRi7hofrtPOGgfkx8nUwzOK_z0sV3NR941qo_vMuNh7g8PF8ex3Gj';
        String clientSecret ='3769990817076060136';
        String username='Shunalism@gmail.com';
        String password='dsmmarch51991!';
        Http h = new Http();
        system.debug('*********1*********');
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        req.setMethod('POST');
        req.setBody('grant_type=password' +'&client_id=' + clientId+'&client_secret=' + clientSecret +'&username=' + EncodingUtil.urlEncode(username, 'UTF8')+'&password=' + EncodingUtil.urlEncode(password, 'UTF8'));
        
        system.debug('*********3*********');
        system.debug('***req****'+req);
        if(Test.isRunningTest()){

        }
        else{
         HttpResponse response = h.send(req);
                  Map<String,String> res = (Map<String,String>)JSON.deserialize(response.getBody(),Map<String,String>.class);
        system.debug('***res****'+res  );
        this.accesstoken = res.get('access_token');
        this.instanceurl = res.get('instance_url');
        system.debug('instanceurl-->'+instanceurl+'-->'+accesstoken );
         }
   //      system.debug('#############'+response.getBody() );

       
    }

    public HttpResponse createLead(){

        String requestUrl = instanceUrl +'/services/apexrest/Lead';
        HttpResponse resObject = new HttpResponse();
        Http httpObj = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(requestUrl);
        req.setMethod('POST');
        req.setHeader('charset','UTF8');
        req.setHeader('Authorization', 'Bearer ' + accesstoken );
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('accept','application/json');
        String body = '{"firstName" : "anjali","lastName" : "patel","email" : "anjali@fdgmail.email","phone" : "23456","company":"itcs"}';
        req.setBody(body);
        HttpResponse response = httpObj.send(req);
        system.debug('****]Response Body******'+response.getBody());
        return response;
    }

public HttpResponse UpdatingLead(){

        String requestUrl = instanceUrl +'/services/apexrest/Lead/Insert?_HttpMethod=PATCH&Id=00Q2800000HuwPq';
        HttpResponse resObject = new HttpResponse();
        Http httpObj = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint(requestUrl);
        req.setMethod('POST');
        
        
        req.setHeader('Authorization', 'Bearer ' + accesstoken );
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('accept','application/json');
        String body = '{"firstName" : "rahul","lastName" : "mehra","email" : "robin.cool@email.email","phone" : "23456"}';


        req.setBody(body);
        HttpResponse response = httpObj.send(req);
        system.debug('****]Response Body******'+response.getBody());
        return response;
    }

public HttpResponse DeleteLead(){

        String requestUrl = instanceUrl +'/services/apexrest/Lead?FirstName=err&LastName=abla&Email=raj.cool@email.email&Phone=00000';
        HttpResponse resObject = new HttpResponse();
        Http httpObj = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint(requestUrl);
        req.setMethod('DELETE');
        
        
        req.setHeader('Authorization', 'Bearer ' + accesstoken );
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('accept','application/json');
       String body = '{"firstName" : "err","lastName" : "abla","email" : "raj.cool@email.email","phone" : "13456","company" : "eternus"}';


      req.setBody(body);
        HttpResponse response = httpObj.send(req);
        system.debug('****]Response Body******'+response.getBody());
        return response;
    }

       

}