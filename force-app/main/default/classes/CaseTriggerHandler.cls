public with sharing class CaseTriggerHandler extends TriggerHandler{
    public static final String SECURITY_CODE_ERROR_MESSAGE = 'Security Code does not exist';
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
                newCs.addError(SECURITY_CODE_ERROR_MESSAGE);
            }    
            else{
                newCs.State__c = codeMappings.get(newCs.Security_Code__c).State__c;
            }      
        }       
    }
}