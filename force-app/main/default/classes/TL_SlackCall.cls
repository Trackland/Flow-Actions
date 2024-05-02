public with sharing class TL_SlackCall {
  @InvocableMethod(label='Slack Call' description='Send Message to Slack.')
  public static List<Boolean> sendMessage(List<Requests> requests) {
    String message = requests[0].message;
    String webhook = requests[0].webhook;
    String jsonBody = '{"text": "' + message + '"}';
    sendMessageAsync(jsonBody, webhook);
    return new List<Boolean>{ true };
  }

  @future(callout=true)
  public static void sendMessageAsync(String jsonBody, String webhook) {
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint(webhook);
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json');
    request.setBody(jsonBody);
    HttpResponse response = !Test.isRunningTest() ? http.send(request) : new HttpResponse();
  }

  public class Requests {
    @InvocableVariable(label='Message' description='Message to send to slack' required=true)
    public String message;
    @InvocableVariable(label='Webhook channel' description='webhook channel to recive the message' required=true)
    public String webhook;
  }
}
