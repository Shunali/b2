public with sharing class query2 {
  public void  first()
  {
List<Contact> record = [SELECT Id, Email FROM Contact];
System.debug(record);
  
  }
  
  public void second()
  {
  Map<Id,User> B = new Map<Id,User>([SELECT Id,name FROM User where isActive= true ]);
System.debug(B);
  
  }
  
  public void third()
  {
  
  list <Account> Acc= [SELECT name,Id FROM Account];
Map<Id,Account>m1 = new Map<Id,Account> (Acc);
system.debug(m1);

  }
  
  
  public void four()
  {
  list <Account> Acc1=[select Id,name from account where Enrollment_Year__c includes ('2010')];
   system.debug(Acc1);
   
    list <Account> Acc2=[select Id,name from account where Enrollment_Year__c includes ('2013','2014')];
   system.debug(Acc2);
    }
    
    public void five()
    {
    list <Account> Acc= [Select Name FROM Account where BillingState NOT IN ('Maharashtra','Kerala')
    ORDER BY Name DESC NULLS LAST limit 10000];
	system.debug(Acc);
    }
    
    public void six()
    {
    list <opportunity> Acc=[select id ,name from opportunity where (amount>10000) and  (isDeleted=true) order by CreatedDate ASC limit 100 offset 50];
    system.debug(Acc);
    }
    
}