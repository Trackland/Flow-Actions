public with sharing class TL_Datetime_add {

    @InvocableMethod(label='Add units of time to Datetime' description='Pass a unit and a value for the units to get an adjusted datetime.' category='Account')
    public static List<Results> addToDateTime(List<Requests> requests) {
        String unit = requests[0].unit;
        Integer value = requests[0].value;
        DateTime input = requests[0].input;
 
        Results res = new Results();
        res.output = addSwitch(unit, input, value);
        List<Results> results = new List<Results>();
        results.add(res);
        return results;
    }

    public static Datetime addSwitch(String unit, Datetime input, Integer value){
        switch on unit.toLowerCase() {
            when 'day' {
                System.debug('Adding ' + value + ' days to ' + input);
                return input.addDays(value);
            }
            when 'hour' {
                return input.addHours(value);
            }
            when 'minute' {
                return input.addMinutes(value);
            }
            when 'second' {
                return input.addSeconds(value);
            }
            when 'year' {
                return input.addYears(value);
            }
            when 'month' {
                return input.addMonths(value);
            }
            when else {
                return input.addHours(value);
            }
        }        
    }

    public class Requests {
        @InvocableVariable(label='Value' description='Integer value to add.' required=true)
        public Integer value;
        @InvocableVariable(label='Unit' description='Unit of time (Singular!). ie... day, hour, second' required=true)
        public String unit;
        @InvocableVariable(label='DateTime Input' description='Existing datetime to have time added.' required=true)
        public DateTime input;
    }  

    public class Results {
        @InvocableVariable(label='DateTime Output' description='The changed datetime' required=true)
        public Datetime output;
    }

}