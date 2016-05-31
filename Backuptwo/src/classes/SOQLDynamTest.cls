@isTest
public class SOQLDynamTest {   // Test Class


 @isTest
static void testSOQLDynamOneTest() {   // test class method 1

SOQLDynam obj = new SOQLDynam();
obj.selectedObjects='a__c';
obj.Details();
system.assertequals(obj.fields.size(),14);
}

 @isTest
static void testSOQLDynamSecondTest() {   // test class method 2
list<String>sfields=new List<String>();
sfields.add('name');
sfields.add('lastmodifieddate');
SOQLDynam obj = new SOQLDynam();
obj.selectedObjects='a__c';
obj.sfields=sfields;
obj.Details();
obj.addFields();
system.assertequals(obj.fSelected.size(),2);
}

 @isTest
static void testSOQLDynamThirdTest() {   // test class method 3
list<String>sfields=new List<String>();
sfields.add('name');
sfields.add('lastmodifieddate');
list<String>rfields=new List<String>();
rfields.add('lastmodifieddate');
SOQLDynam obj = new SOQLDynam();
obj.selectedObjects='a__c';
obj.sfields=sfields;
obj.rfields=rfields;
obj.Details();
obj.addFields();
obj.removeFields();
system.assertequals(obj.fSelected.size(),1);
}


 @isTest
static void testSOQLDynamFourthTest() {   // test class method 4
list<String>sfields=new List<String>();
sfields.add('name');
sfields.add('lastmodifieddate');
//List<SelectOption> RecordNumber = new List<SelectOption>();
//RecordNumber .add(new SelectOption('5','500'));

SOQLDynam obj = new SOQLDynam();
obj.selectedObjects='a__c';
obj.sfields=sfields;

obj.Details();
obj.addFields();
obj.RecordNumber= '5000';
//system.assertequals(obj.RecordNumber,2);
//obj.sorts='DESC';
obj.myQueryData();


}
}