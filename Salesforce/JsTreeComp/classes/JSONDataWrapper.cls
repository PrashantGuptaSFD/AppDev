/* 
* Class Name  	:   JSONDataWrapper 
* Description   :   Wrapper class to create json data for tree structure
*/
public class JSONDataWrapper {
    public String id;
    public String text;
    public String icon;
    public String parent;
    public State state = new State();
    public Object liAttributes;
    public Object aAttributes;
    //List of Special attributes for Tree nodes
    Public Map<String,String> a_attr;
    public class State {
        public state(){
            
        }
        public Boolean opened;
        public Boolean disabled;
        public Boolean selected;
    }
    public JSONDataWrapper(){
        a_attr = new Map<String,String>();
    }
}