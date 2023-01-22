/*
Sample Wrapper Class (Mostly used for Inbound APIs)
This is a Wrapper Class which can be used to Deserialize the below JSON

{
    "svcName": "FlipkartCreateLoan",
    "requestStructure": {
        "CustomerID": "Test123",
        "Mobile": "9581850070",
        "ProductBought": "Iphone 13 128 GB"
    }
}


Usage :
WrapperClass wrapper = WrapperClass.parse(yourJSONString);
string ServiceName = wrapper.svcName; //from Declared Variables

*/


public class WrapperClass{
    //Declare Variables
	public String svcName;	//FlipkartCreateLoan
	public cls_requestStructure requestStructure;
	class cls_requestStructure {
		public String CustomerID;	//Test123
		public String Mobile;	//9581850070
		public String ProductBought;	//Iphone 13 128 GB
	}
    //Create Method to Parse JSON
	public static WrapperClass parse(String json){
		return (WrapperClass) System.JSON.deserialize(json, WrapperClass.class);
	}
	
}