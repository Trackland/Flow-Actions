@IsTest
public with sharing class TL_Datetime_Tests {
  @IsTest
  public static void Test_add() {
    TL_Datetime_add.Requests params = new TL_Datetime_add.Requests();
    params.input = Datetime.newInstance(2019, 1, 1);
    List<TL_Datetime_add.Results> results;

    params.unit = String.valueOf('day');
    params.value = 1;
    results = TL_Datetime_add.addToDateTime(new List<TL_Datetime_add.Requests>{ params });
    System.assertEquals(params.input.addDays(params.value), results[0].output);

    params.unit = String.valueOf('hour');
    params.value = 1;
    results = TL_Datetime_add.addToDateTime(new List<TL_Datetime_add.Requests>{ params });
    System.assertEquals(params.input.addHours(params.value), results[0].output);

    params.unit = String.valueOf('minute');
    params.value = 1;
    results = TL_Datetime_add.addToDateTime(new List<TL_Datetime_add.Requests>{ params });
    System.assertEquals(params.input.addMinutes(params.value), results[0].output);

    params.unit = String.valueOf('year');
    params.value = 1;
    results = TL_Datetime_add.addToDateTime(new List<TL_Datetime_add.Requests>{ params });
    System.assertEquals(params.input.addYears(params.value), results[0].output);

    params.unit = String.valueOf('month');
    params.value = 1;
    results = TL_Datetime_add.addToDateTime(new List<TL_Datetime_add.Requests>{ params });
    System.assertEquals(params.input.addMonths(params.value), results[0].output);
  }

  @IsTest
  public static void Test_format() {
    TL_Datetime_format.Requests params = new TL_Datetime_format.Requests();
    params.input = Datetime.newInstance(2019, 1, 1);
    List<TL_Datetime_format.Results> results;
    params.formatter = 'yyyy-MM-dd';
    params.timezone = 'America/New_York';
    results = TL_Datetime_format.format(new List<TL_Datetime_format.Requests>{ params });
    // System.assertEquals('2019-01-01', results[0].output);
  }

  @IsTest
  public static void Test_Log() {
    TL_Log.Requests params = new TL_Log.Requests();
    params.input = 'test';
    TL_Log.init(new List<TL_Log.Requests>{ params });
  }

  @IsTest
  public static void Test_sendAt() {
    TL_Datetime_getPaddedDate.Requests params = new TL_Datetime_getPaddedDate.Requests();
    params.before = 10;
    params.beforeUnits = 'day';
    params.beforeDatetime = Datetime.newInstance(2019, 2, 1);

    params.delayDatetime = Datetime.newInstance(2019, 1, 1);
    params.delayUnits = 'day';
    params.delay = 5;

    List<TL_Datetime_getPaddedDate.Results> results;
    results = TL_Datetime_getPaddedDate.getSendAt(new List<TL_Datetime_getPaddedDate.Requests>{ params });
    Datetime testDate = Datetime.newInstance(2019, 1, 27);
    System.assertEquals(testDate, results[0].output);
  }
}
