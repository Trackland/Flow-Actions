@IsTest
public with sharing class TL_SlackCall_Tests {
  
  @IsTest
  static void testSlackCall() {
    TL_SlackCall.Requests slackCall = new TL_SlackCall.Requests();
    slackCall.message = 'Test Message';
    slackCall.webhook = 'webhook';
    TL_SlackCall.sendMessage(new List<TL_SlackCall.Requests>{slackCall});
  }
}