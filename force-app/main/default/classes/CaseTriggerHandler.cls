public with sharing class CaseTriggerHandler extends TriggerHandler{
    
    List<Case> newCases = Trigger.new;

    public override void beforeInsert(){
        processSecurityCode();
    }

    public override void beforeUpdate(){
        processSecurityCode();
    }
       
    public void processSecurityCode(){
        Map<String, Security_Code_Mapping__mdt> codeMappings = Security_Code_Mapping__mdt.getAll();        
        for(Case newCs : newCases){
            if(!codeMappings.containsKey(newCs.Security_Code__c)){
                newCs.addError('Security Code does not exist');
            }    
            else{
                newCs.State__c = codeMappings.get(newCs.Security_Code__c).State__c;
            }      
        }       
    }
}