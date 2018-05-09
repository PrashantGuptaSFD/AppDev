/* 
* Class Name  	:   JSONDataWrapper 
* Description   :   Wrapper class to create json data for tree structure
*/
@isTest
private class jsTreeComponentControllerTest {
    @testSetup
    private static void createData(){
        List<Account> parentAccounts = new List<Account>();
        for(integer i=0; i<=3; i++){
            Account acc = new Account(name='Parent Account ' + i);
            parentAccounts.add(acc);
        }
        if(parentAccounts!=null && !parentAccounts.isEmpty()){
            insert parentAccounts;
        }
        
        List<Account> childAccounts = new List<Account>();
        for(integer i=0; i<=3; i++){
            Account acc = new Account(name='Child Account ' + i, ParentID = parentAccounts[i].id);
            childAccounts.add(acc);
        }
        if(childAccounts!=null && !childAccounts.isEmpty()){
            insert childAccounts;
        }
    }
	private static testMethod void test() {
        test.startTest();
            jsTreeComponentController controller = new jsTreeComponentController();
        test.stopTest();
        system.assertNotEquals(null,controller.jasonString);
        system.assertNotEquals(null,controller.query);
	}

}