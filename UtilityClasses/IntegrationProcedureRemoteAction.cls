global class testApex implements System.Callable, omnistudio.VlocityOpenInterface {
    
    global Object call(String action, Map<String,Object> args) {
        system.debug('method --> '+action);
        system.debug('args --> '+args);
        map<string,Object>input = (map<string,Object>)args.get('input');
        map<string,Object>output = (map<string,Object>)args.get('output');
        map<string,Object>outPutData = new map<string,Object>();
        system.debug('input --> '+input);
        system.debug('recordId --> '+input.get('recordId'));
        list<Account> accList = [select id, name from Account limit 5];
        list<string> accToSend = new list<string>();
        for(Account acc : accList){
            accToSend.add(acc.Name);
        }
        outPutData.put('AccountNames',accToSend);
        outPutData.put('someKey',input.get('recordId'));
        
        output.put('outputNode',outPutData);
        output.remove('error');
        output.remove('errorCode');
        system.debug('output --> '+output);
        return null;
    }
    
    //InvokeMethod
    global boolean invokeMethod(string methodName, map<string,Object>input, map<string,Object>output, map<string,Object>options){
        return null;
    }
    
}