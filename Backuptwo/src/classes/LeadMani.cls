public class LeadMani{
public String accessToken;
public String instanceUrl;
public void login(){
String clientId ='3MVG9ZL0ppGP5UrD6PtYtPHJfemaAe46LRi7hofrtPOGgfkx8nUwzOK_z0sV3NR941qo_vMuNh7g8PF8ex3Gj';
String clientSecret ='3769990817076060136';
String username='Shunalism@gmail.com';
String password='March51991!';
Http h = new Http();
system.debug('*********1*********');
HttpRequest req = new HttpRequest();
req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
req.setMethod('POST');
req.setBody('grant_type=password' +'&client_id=' + clientId+'&client_secret=' + clientSecret +'&username=' + EncodingUtil.urlEncode(username, 'UTF8')+'&password=' + EncodingUtil.urlEncode(password, 'UTF8'));

system.debug('*********3*********');
req.setBody('grant_type=password' +
                        '&client_id=' + clientId +
                        '&client_secret=' + clientSecret + 
                        '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') + 
                        '&password=' + EncodingUtil.urlEncode(password, 'UTF-8'));

        
        HttpResponse response = h.send(req);
        Map<String,String> res  = (Map<String,String>)JSON.deserialize(response .getBody(),Map<String,String>.class);
        //system.debug('***Response Body****'+response.access_token);
        this.accessToken = res.get('access_token');
        
        this.instanceurl = res.get('instance_url');
        system.debug('instanceurl-->'+instanceurl+'-->'+accessToken );
//return res.getBody();
}

public HttpResponse createLead(){

String requestUrl = instanceUrl +'/services/apexrest/Lead';
HttpResponse resObject = new HttpResponse();
Http httpObj = new Http();
HttpRequest req = new HttpRequest();

req.setEndpoint(requestUrl);
req.setMethod('POST');


req.setHeader('Authorization', 'Bearer ' + accessToken );
req.setHeader('Content-Type', 'application/json');
req.setHeader('accept','application/json');
String body = '{"firstName" : "rajni","lastName" : "mehra","email" : "jyo.cool@email.email","phone" : "123456890","company":"Wipro"}';
req.setBody(body);
        

//URL will be your Salesforce REST API end point where you willdo POST,PUT,DELETE orGET

HttpResponse response = httpObj.send(req);
//Map<String,String> res = (Map<String,String>)JSON.deserialize(response .getBody(),Map<String,String>.class);
system.debug('****]Response Body******'+response.getBody());
return response;
}

}