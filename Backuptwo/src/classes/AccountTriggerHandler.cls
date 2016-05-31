public class AccountTriggerHandler {
    
    AccountTriggerHelper OAccountTriggerHelper = new AccountTriggerHelper();
    
 public void onAfterUpdate(Map<Id, Name> pOldName, 
                              Map<Id, Name> pNewName){
                                  
         OAccountTriggerHelper.Display( pOldName, pNewName);
      
    }
    

   /* public void onAfterInsert(Map<Id, Name> pOldOrderName, 
                              Map<Id, Name> pNewOrderName){
      OAccountTriggerHelper.Disply(pOldOrderName, pNewOrderName);
                              }
    
      //Method exexuted on BEFORE UPDATE EVENT of OrderLineItem
 /*   public void onBeforeUpdate(Map<Id, Name> oldOrderLineItemMap, 
                               List<Order_Line_Item__c> newOrderLineItemList){   
    }
    
    public void onBeforeInsert(List<Name> newOrderName){
        
    
    }
    
    public void onAfterUpdate(Map<Id,Name> pOldOrderName, 
                              Map<Id, Name> pNewOrderName){
        
    }
    
    public void onAfterInsert(Map<Id,Name> pOldOrderName, 
                              Map<Id, Name> pNewOrderName){
                                                             
    }

    public void onAfterDelete(Map<Id, Name> oldOrderName){
    
    }*/
}