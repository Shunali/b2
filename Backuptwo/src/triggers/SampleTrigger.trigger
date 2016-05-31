trigger SampleTrigger on Sample__c (before insert) {
 Sample__c[] sample = Trigger.new;
    SampleValue.applyDiscount(sample);
      System.debug(Trigger.new);
    }