public without sharing class GlobalUtility {
	
    //Create Integration Message Record
    public static void createIntMsgRecord(string svc, string status, string request, string response, string referenceNum){
        Integration_Message__c msg = new Integration_Message__c();
        //Assign Data
        msg.SVC_Name__c = svc;
        msg.Status__c = status;
        msg.Request__c = request;
        msg.Response__c = response;
        msg.Reference_Number__c = referenceNum;
        // Insert Record
        insert msg;
    }
    
    //Create Error logs - 'Reference ID', Exception, 'Class Name'
    public static void createAlog(Exception ex, string srcClass, string srcMethod){
        Application_Log__c alog = new Application_Log__c();
        //Assign Data
        alog.Debug_Level__c = 'ERROR';
        alog.Stack_Trace__c = ex.getStackTraceString();
        alog.Message__c = ex.getMessage();
        alog.Exception_Type__c = ex.getTypeName();
        alog.Apex_Class__c = srcClass;
        alog.Apex_Method__c = srcMethod;
        // Insert Record
        insert alog;
    }
    	
}