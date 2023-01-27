/*
https://<your org url>/services/apexrest/RESTAPI

Request :

{
    "data": {
        "Name": "YT Hospital 2",
        "Address": "Delhi, India",
        "isActive": true,
        "NumOfEmployees": 140,
        "Turnover": 5000,
        "contactNumber": "9632555666"
    },
    "action": "insert"
}

*/
@RestResource(urlMapping='/RESTAPI/*')
global with sharing class RestAPIv3 {
    
    @HttpPost
    global static void doPost(){
        string jsonRequestStr = RestContext.request.requestBody.toString();
        string responseStr;
        boolean status;
        string response;
        RequestWrapper wrapper = RequestWrapper.parse(jsonRequestStr);
        //Create Record (you can change this hospital object to any object your org has)
        if(!string.isBlank(wrapper.action) && wrapper.action.equalsIgnoreCase('insert')){
            Hospital__c hospital = new Hospital__c();
            hospital.Name = wrapper.data.Name;
            hospital.Address__c = wrapper.data.Address;
            hospital.Contact_Number__c = wrapper.data.contactNumber;
            hospital.isActive__c = wrapper.data.isActive;
            hospital.Number_of_Employees__c = wrapper.data.NumOfEmployees;
            hospital.Turnover__c= wrapper.data.Turnover;
            insert hospital;
            responseStr = 'Your Record is Created with Record Id --> '+hospital.Id;
            status = true;
        }
        else{
            responseStr = 'Error --> Please make sure the action is insert only.';
            status = false;
        }
        //Get Response
        response = getResponse(status,responseStr);
        //Send Response
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = blob.valueOf(response);
    }
    
    //Request Wrapper
    public class RequestWrapper {
        public cls_data data;
        public String action;	//update
    }
    //Inner Request Wrapper
    public class cls_data {
        public String Name;	//City Hospital 2
        public String Address;	//Pune, India
        public boolean isActive;
        public Decimal NumOfEmployees;	//4153
        public Decimal Turnover;	//94123
        public String contactNumber;	//9856412311
    }
    //Parse - Deseriliaze Request
    public static RequestWrapper parse(String json){
        return (RequestWrapper) System.JSON.deserialize(json, RequestWrapper.class);
    }
    //Response Wrapper
    public class ResponseWrapper {
        public boolean status;
        public String message;	//update
    }
    //Create Response
    public static string getResponse(boolean status, string msg){
        ResponseWrapper respWrapper = new ResponseWrapper();
        respWrapper.status = status;
        respWrapper.message = msg;
        return JSON.serialize(respWrapper);
    }
    
    
}