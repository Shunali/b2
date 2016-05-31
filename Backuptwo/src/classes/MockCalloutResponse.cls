//This class is for defining the response for the mock callout for lead webservice callouts.
@isTest
public class MockCalloutResponse implements HttpCalloutMock {
    
    //This method generates the response for the mock callouts made from testclass of leadwebservice callout class.
    public HTTPResponse respond(HTTPRequest objRequest){
        HttpResponse objResponse= new HttpResponse();
        objResponse.setStatusCode(200);
        objResponse.setStatus('OK');
        return objResponse;
    }
}