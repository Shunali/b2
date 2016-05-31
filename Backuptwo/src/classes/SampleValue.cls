public class SampleValue {
    
public static void applyDiscount(Sample__c[] sample) {

for (Sample__c s :sample){

s.No_of_item__c *= 2;
} }}