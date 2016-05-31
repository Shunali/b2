trigger AccountTrigger on Account (after insert,after update) {
    
     AccountTriggerHandler oAccountTriggerHandler = new AccountTriggerHandler();
    if(trigger.isAfter&& trigger.isInsert )
    {
        
       
    }
     if(trigger.isAfter&& trigger.isUpdate )
    {
        
       
    }
    

}