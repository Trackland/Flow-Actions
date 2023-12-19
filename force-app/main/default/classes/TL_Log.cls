public with sharing class TL_Log {

    @InvocableMethod(label='System Log' description='A way to do system logs from Flows')
    public static void init(Requests[] request){
        String str = request[0].input;
        System.debug(str);
    }   

    public class Requests {
        @InvocableVariable(label='String' required=true)
        public String input;
    }

}