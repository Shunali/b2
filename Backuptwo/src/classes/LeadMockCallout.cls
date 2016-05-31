//This class tests the mock callouts for lead webservice callouts.
@isTest
public class LeadMockCallout {
    
    //This testmethod tests the createLeadCallout of LeadServiceCallout.
    @isTest
    public static  void createLeadCalloutTest(){
        Test.setMock(HttpCalloutMock.class, new MockCalloutResponse()); 
        ConsumerDetail objCallout=new ConsumerDetail();
        HttpResponse objResponse=objCallout.createLead();
       System.assertEquals(200, objResponse.getStatusCode());
    }
    
    //This testmethod tests the deleteLeadCallout of LeadServiceCallout.
    @isTest
    public static void deleteLeadCalloutTest(){
        Test.setMock(HttpCalloutMock.class, new MockCalloutResponse()); 
        ConsumerDetail objCallout=new ConsumerDetail ();
        HttpResponse objResponse=objCallout.DeleteLead();
        System.debug(objResponse.getBody());
        System.assertEquals(200, objResponse.getStatusCode());
    }
    
    //This testmethod tests the updateLeadCallout of LeadServiceCallout.
    @isTest
    public static void updateLeadCalloutTest(){
        Test.setMock(HttpCalloutMock.class, new MockCalloutResponse()); 
        ConsumerDetail objCallout=new ConsumerDetail ();
        HttpResponse objResponse=objCallout.UpdatingLead();
        System.debug(objResponse.getBody());
        System.assertEquals(200, objResponse.getStatusCode());
    }
    
    //This testmethod tests the login method of leadservice callout.
    @isTest
    public static void testLogin(){
        Test.setMock(HttpCalloutMock.class, new MockCalloutResponse()); 
        ConsumerDetail objCallout=new ConsumerDetail ();
        objCallout.login();
      //  System.assertEquals(200, objResponse.getStatusCode());
        
    }
}