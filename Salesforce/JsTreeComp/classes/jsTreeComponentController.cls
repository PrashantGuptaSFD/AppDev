/* 
* Class Name  	:   JSONDataWrapper 
* Description   :   Wrapper class to create json data for tree structure
* Instruction   :   Set Attributes to customize
*/
public class jsTreeComponentController {
    
    List<JSONDataWrapper> JSONData{get;set;}
    public String jasonString{get;set;}
    List<sObject> queriedData = new List<sObject>();
    Public String Query{get;set;}
    Public String parentRelationField{get;set;}
    Public String labelField{get;set;}
    Public String IdField{get;set;}
    Public Boolean showSearchBox{get;set;}
    Public Boolean hasClickAction{get;set;}
    
    public jsTreeComponentController(){
        setAttributes();
        JSONData = new List<JSONDataWrapper>();
        queriedData = Database.query(Query);
        System.debug('record List : ' + queriedData);
        for(sObject record : queriedData){
            JSONDataWrapper JData = new JSONDataWrapper();
            JData.Id = (String)record.get(IdField);
            if(record.get(parentRelationField)!=null){
                JData.parent=(String)record.get(parentRelationField);
            }else{
                JData.parent = '#';
            }
            JData.text = (String)record.get(labelField);
            JSONData.add(JData);
        }
        
        jasonString = System.JSON.serialize(JSONData);
    }
    public void setAttributes(){
        showSearchBox = true;
        Query = 'SELECT Id,Name,ParentID,Parent.Name from Account';
        parentRelationField = 'ParentID';
        labelField = 'Name';
        IdField = 'ID';
        hasClickAction = true;
        showSearchBox = true;
    }
}