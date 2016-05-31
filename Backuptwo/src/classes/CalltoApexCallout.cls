public class CalltoApexCallout {
  
     Public String ID;
    public void callingCallout(String QueryID)
    {
        ID = QueryID;
        Webservicescallout ob=new Webservicescallout();
        ob.getInfo(ID);
    }
}