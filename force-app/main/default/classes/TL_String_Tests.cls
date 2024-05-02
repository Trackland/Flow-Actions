@IsTest
public with sharing class TL_String_Tests {
  @IsTest
  static void Stringtest_splitString() {
    TL_String_Split.Requests params = new TL_String_Split.Requests();
    params.delimiter = String.valueOf('|');
    params.str = 'abe|ball | charlie | dell|ernie';
    List<String> expected = new List<String>{ 'abe', 'ball', 'charlie', 'dell', 'ernie' };
    List<TL_String_Split.Results> actual = TL_String_Split.init(new List<TL_String_Split.Requests>{ params });
    System.assertEquals(expected[2], actual[0].output[2]);
    // System.assertEquals(actual[2], 'charlie');
  }
}
