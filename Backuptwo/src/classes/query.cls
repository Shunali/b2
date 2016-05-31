public with sharing class query {

public void acc()
{
List<account> record =[select id from account where Persons_account__c = false ];
for (account a : record)
{
System.debug(a);
}

for (integer i=0; i<record.size();i++)
{
System.debug(record[i]);
}
}


public void opp()
{
List<Opportunity> record =[select Id, Name FROM Opportunity where Account.name !=null and DeliveryInstallationStatus__c= 'In progress'];

System.debug(record);


set<account> sets = new set<account>();
List <account>L=([select id  from account]);
for (account a: L)
{
    sets.add(a);
   System.debug(sets);
}


Map<Id,Opportunity> B = new Map<Id,Opportunity>([SELECT Id,AccountId FROM Opportunity]);
System.debug(B);

}


public void dmlup()
{
	
system.debug([SELECT COUNT() FROM Account WHERE Name LIKE 'a%']);
Account acc  = [select id,Name from Account limit 1];
acc.Name = 'aest';
update acc;
system.debug(acc);

}

public void sortas()
{
list<campaign> cc= [select name from campaign order by name asc limit 10];
system.debug(cc);
}

public void sortde()
{
list<campaign> cc= [select name from campaign order by name desc limit 10];
system.debug(cc);
}


public void con()
{
list<contact> cc= [Select name,id  From Contact where  LastModifiedDate = Today];
system.debug(cc);

}


public void fourth(){

//Map<Id,Opportunity> acc = new Map<Id,Opportunity>([SELECT Id,AccountId FROM Opportunity]);
list <Opportunity> L= [SELECT Id,accountId FROM Opportunity ];
Map<Id, List<Id>>m1 = new Map<Id, List<Id>>();

	for(Opportunity op : L ) {
		  system.debug(op.Id);
	    if(m1.containsKey(op.Id)) {
	    	  system.debug(op.Id);
	        List<Id> usersId = m1.get(op.Id);
	        usersId.add(op.Id);
	        m1.put(op.Id, usersId);
	           system.debug(m1);
	    } else {
	    	   system.debug(op.Id);
	        m1.put(op.Id, new List<Id> {op.Id }); // key and values
	        system.debug(m1);
	    }

	}
}


  public void Opp1()
    {
     list<Opportunity> newopportunity = new List<Opportunity>([select Opportunity.AccountId from Opportunity]);
     map<id, list<Opportunity>> newaccount= new map<id, list<opportunity>>();
     List <Opportunity> newopportunity2 = new List <opportunity>();
     for(opportunity idvar:newopportunity)
     {
      newopportunity2 = [select opportunity.id from opportunity where opportunity.AccountId=:idvar.id];
      if(!(newaccount.containsKey(idvar.id)))
      {
       newaccount.put(idvar.id, newopportunity2);
      }
     }
    }
}