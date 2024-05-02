public with sharing class TL_String_Split {
  @InvocableMethod(label='String Split' description='Split string at delimiter into list of strings.')
  public static List<Results> init(Requests[] request) {
    String str = request[0].str;
    String del = request[0].delimiter;
    if (del == '|')
      del = '\\|';
    List<String> strList = new List<String>();
    for (String s : str.split(del)) {
      if (s.contains(del) || String.isBlank(s))
        continue;
      strList.add(s.trim());
    }
    Results res = new Results();
    res.output = strList;
    List<Results> results = new List<Results>();
    results.add(res);
    return results;
  }

  public class Requests {
    @InvocableVariable(label='String' required=true)
    public String str;
    @InvocableVariable(label='Delimiter' required=true)
    public String delimiter;
  }

  public class Results {
    @InvocableVariable(label='String' description='The changed datetime' required=true)
    public List<String> output;
  }
}
