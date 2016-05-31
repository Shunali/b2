public class Relate {
    
 public void first(){
 List<Contact> r1 =[select id ,name,Contact.Account.name from Contact where Account.Industry = 'media'];
 system.debug(r1);
 }   

}