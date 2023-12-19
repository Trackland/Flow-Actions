public with sharing class TL_Datetime_getPaddedDate {

    @InvocableMethod(label='Get Send At' description='Returns the Send At date for a given Email Id')
    public static List<Results> getSendAt(List<Requests> requests) {
        Integer delay = requests[0].delay;
        String delayUnits = requests[0].delayUnits;
        Datetime delayDatetime = requests[0].delayDatetime;
        Integer before = requests[0].before;
        String beforeUnits = requests[0].beforeUnits;
        Datetime beforeDatetime = requests[0].beforeDatetime;
        Datetime sendAt;

        if(beforeDatetime != null && beforeUnits != null && before != null) {
            Integer beforeInt = before * -1;
            System.debug('beforeInt: ' + beforeInt);
            System.debug('beforeDatetime: ' + beforeDatetime);
            System.debug('beforeUnits: ' + beforeUnits);
            sendAt = TL_Datetime_add.addSwitch(beforeUnits, beforeDatetime, beforeInt);
            System.debug('sendAt: ' + sendAt);
        }

        if(sendAt != null) delayDatetime = sendAt;

        if(beforeDatetime != null && sendAt == null && delayDatetime == null) {
            delayDatetime = beforeDatetime;
        }
    
        if(delayUnits != null && delay != null && delayDatetime != null) {
            Datetime tempDate = TL_Datetime_add.addSwitch(delayUnits, delayDatetime, delay);
            if(tempDate > beforeDatetime) {
                tempDate = TL_Datetime_add.addSwitch(delayUnits, beforeDatetime, -1);
            }
            sendAt = tempDate;
            System.debug('sendAt: ' + sendAt);
        }

        Results res = new Results();
        res.output = sendAt;
        List<Results> results = new List<Results>();
        results.add(res);
        return results;
    }

    public class Requests {
        @InvocableVariable(label='Delay' description='Number of units to delay the Send At date')
        public Integer delay;
        @InvocableVariable(label='Delay Units' description='Units to delay the Send At date')
        public String delayUnits;
        @InvocableVariable(label='Delay Datetime' description='Datetime to delay the Send At date')
        public Datetime delayDatetime;
        @InvocableVariable(label='Before' description='Number of units to before the due date to send the Email')
        public Integer before;
        @InvocableVariable(label='Before Units' description='Units to before the due date to send the Email')
        public String beforeUnits;
        @InvocableVariable(label='Before Datetime' description='Datetime to before the due date to send the Email')
        public Datetime beforeDatetime;
    }

    public class Results {
        @InvocableVariable(label='Send At' description='Send At date for the Email')
        public Datetime output;
    }
}