public class AccountTriggerHelper {

    public void Display(Map<Id, Name> pOldName, 
                                             Map<Id, Name> pNewName)
    {
        
               if (pOldName == pNewName)
               {
                   Trigger.new[0].addError('bad');
                   
               }
    }
    
}