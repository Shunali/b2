@isTest
public class GoobleVFPageControllerTest {

 @isTest
static void testGoobleControllerTestOne() {   // test class method 1
   Contact ConObj=new Contact(FirstName='Shunali',LastName='Mehra');
   insert ConObj;
   CustomEmailObj__c Obj = new CustomEmailObj__c(BodyTxt__c='d',SubjectTxt__c='Search',ContactToEmail__c=ConObj.Id);
   insert Obj ;
    list<DetailRecord__c>lstDe=new List<DetailRecord__c>();
    DetailRecord__c  DRecObj1= new DetailRecord__c();
    DRecObj1.RelatedLink__c=Obj.Id;
    DRecObj1.Link__c='https://dlang.org/';
    DRecObj1.Title__c='D Programming Language: Home';
    DRecObj1.Snippet__c='D is a systems programming language with C-like syntax and static typing. It combines efficiency, control and modeling power with safety and programmer ...';
    insert DRecObj1;
    lstDe.add(DRecObj1);
    DetailRecord__c  DRecObj2= new DetailRecord__c();
    DRecObj2.RelatedLink__c=Obj.Id;
    DRecObj2.Link__c='https://en.wikipedia.org/wiki/D_(programming_la...';
    DRecObj2.Title__c='D (programming language) - Wikipedia, the free encyclopedia';
    DRecObj2.Snippet__c='The D programming language is an object-oriented, imperative, multi-paradigm system programming language created by Walter Bright of Digital Mars and ...';
    insert DRecObj2;
    lstDe.add(DRecObj2);
    GoobleVFPageController ObjController= new GoobleVFPageController();
    ObjController.recid=Obj.id;
    ObjController.RelatedLinks();
    system.assertEquals(lstDe.size(),2);
    
}
}