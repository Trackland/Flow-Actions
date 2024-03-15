public with sharing class TL_Datetime_format {
  
    @InvocableMethod(label='Format datetime' description='pass the formatting string into a date to get the return value' category='Account')
    public static List<Results> format(List<Requests> requests) {
        String formatter = requests[0].formatter;
        Datetime input = requests[0].input;
        String timezone = requests[0].timezone == null ? 'America/New_York' : requests[0].timezone;
        Results res = new Results();
        res.output = input.format(formatter, timezone);
        List<Results> results = new List<Results>();
        results.add(res);
        return results;
    }

    public class Requests {
        @InvocableVariable(label='Format string' description='The string formatter to get back the value.' required=true)
        public String formatter;
        @InvocableVariable(label='DateTime Input' description='Datetime object to be manipulated.' required=true)
        public DateTime input;       
        @InvocableVariable(label='Input Timezone' description='Timezone to modify the date.')
        public String timezone;         
    }  

    public class Results {
        @InvocableVariable(label='String Output' description='A string version of the formatted date or date portion.' required=true)
        public String output;
    }    
}