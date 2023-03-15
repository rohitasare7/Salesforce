/*
Change your class name from RemoteClass1
Change your methodName in if condition (line 10 and line 21)
*/
global class RemoteClass1 implements vlocity_cmt.VlocityOpenInterface {
    //InvokeMethod
    global Boolean invokeMethod(String methodName, Map<String,Object> input, Map<String,Object> output, Map<String,Object> options){
        try{
            if(methodName =='generate') {
                generate(input,output);
                system.debug('Inside invoke method');
            }
        }
        catch(exception e){
            system.debug('Exception --> '+e.getMessage());
        }
        return null;
    }
    
    public static void generate(Map<String,Object> input, Map<String,Object> output){
        String name = String.valueOf(input.get('name'));
        Integer randomNum = Integer.valueOf(math.random()*100000);
        String timeNow = string.valueof(system.now());
        system.debug('input --> '+input);
        output.put('RandomNumber',randomNum);
        output.put('Name',name);
        output.put('Time',timeNow);
    }
}