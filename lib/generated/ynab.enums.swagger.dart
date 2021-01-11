import 'package:json_annotation/json_annotation.dart';

enum AccountType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('checking')
  checking,
  @JsonValue('savings')
  savings,
  @JsonValue('cash')
  cash,
  @JsonValue('creditCard')
  creditcard,
  @JsonValue('lineOfCredit')
  lineofcredit,
  @JsonValue('otherAsset')
  otherasset,
  @JsonValue('otherLiability')
  otherliability,
  @JsonValue('payPal')
  paypal,
  @JsonValue('merchantAccount')
  merchantaccount,
  @JsonValue('investmentAccount')
  investmentaccount,
  @JsonValue('mortgage')
  mortgage
}

const $AccountTypeMap = {
  AccountType.checking: 'checking',
  AccountType.savings: 'savings',
  AccountType.cash: 'cash',
  AccountType.creditcard: 'creditCard',
  AccountType.lineofcredit: 'lineOfCredit',
  AccountType.otherasset: 'otherAsset',
  AccountType.otherliability: 'otherLiability',
  AccountType.paypal: 'payPal',
  AccountType.merchantaccount: 'merchantAccount',
  AccountType.investmentaccount: 'investmentAccount',
  AccountType.mortgage: 'mortgage',
  AccountType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum SaveAccountType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('checking')
  checking,
  @JsonValue('savings')
  savings,
  @JsonValue('creditCard')
  creditcard,
  @JsonValue('cash')
  cash,
  @JsonValue('lineOfCredit')
  lineofcredit,
  @JsonValue('otherAsset')
  otherasset,
  @JsonValue('otherLiability')
  otherliability
}

const $SaveAccountTypeMap = {
  SaveAccountType.checking: 'checking',
  SaveAccountType.savings: 'savings',
  SaveAccountType.creditcard: 'creditCard',
  SaveAccountType.cash: 'cash',
  SaveAccountType.lineofcredit: 'lineOfCredit',
  SaveAccountType.otherasset: 'otherAsset',
  SaveAccountType.otherliability: 'otherLiability',
  SaveAccountType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum CategoryGoalType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('TB')
  tb,
  @JsonValue('TBD')
  tbd,
  @JsonValue('MF')
  mf,
  @JsonValue('NEED')
  need,
  @JsonValue('null')
  $null
}

const $CategoryGoalTypeMap = {
  CategoryGoalType.tb: 'TB',
  CategoryGoalType.tbd: 'TBD',
  CategoryGoalType.mf: 'MF',
  CategoryGoalType.need: 'NEED',
  CategoryGoalType.$null: 'null',
  CategoryGoalType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum SaveTransactionCleared {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('cleared')
  cleared,
  @JsonValue('uncleared')
  uncleared,
  @JsonValue('reconciled')
  reconciled
}

const $SaveTransactionClearedMap = {
  SaveTransactionCleared.cleared: 'cleared',
  SaveTransactionCleared.uncleared: 'uncleared',
  SaveTransactionCleared.reconciled: 'reconciled',
  SaveTransactionCleared.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum SaveTransactionFlagColor {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('red')
  red,
  @JsonValue('orange')
  orange,
  @JsonValue('yellow')
  yellow,
  @JsonValue('green')
  green,
  @JsonValue('blue')
  blue,
  @JsonValue('purple')
  purple,
  @JsonValue('null')
  $null
}

const $SaveTransactionFlagColorMap = {
  SaveTransactionFlagColor.red: 'red',
  SaveTransactionFlagColor.orange: 'orange',
  SaveTransactionFlagColor.yellow: 'yellow',
  SaveTransactionFlagColor.green: 'green',
  SaveTransactionFlagColor.blue: 'blue',
  SaveTransactionFlagColor.purple: 'purple',
  SaveTransactionFlagColor.$null: 'null',
  SaveTransactionFlagColor.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum TransactionSummaryCleared {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('cleared')
  cleared,
  @JsonValue('uncleared')
  uncleared,
  @JsonValue('reconciled')
  reconciled
}

const $TransactionSummaryClearedMap = {
  TransactionSummaryCleared.cleared: 'cleared',
  TransactionSummaryCleared.uncleared: 'uncleared',
  TransactionSummaryCleared.reconciled: 'reconciled',
  TransactionSummaryCleared.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum TransactionSummaryFlagColor {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('red')
  red,
  @JsonValue('orange')
  orange,
  @JsonValue('yellow')
  yellow,
  @JsonValue('green')
  green,
  @JsonValue('blue')
  blue,
  @JsonValue('purple')
  purple,
  @JsonValue('null')
  $null
}

const $TransactionSummaryFlagColorMap = {
  TransactionSummaryFlagColor.red: 'red',
  TransactionSummaryFlagColor.orange: 'orange',
  TransactionSummaryFlagColor.yellow: 'yellow',
  TransactionSummaryFlagColor.green: 'green',
  TransactionSummaryFlagColor.blue: 'blue',
  TransactionSummaryFlagColor.purple: 'purple',
  TransactionSummaryFlagColor.$null: 'null',
  TransactionSummaryFlagColor.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown'
};

enum ScheduledTransactionSummaryFrequency {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('never')
  never,
  @JsonValue('daily')
  daily,
  @JsonValue('weekly')
  weekly,
  @JsonValue('everyOtherWeek')
  everyotherweek,
  @JsonValue('twiceAMonth')
  twiceamonth,
  @JsonValue('every4Weeks')
  every4weeks,
  @JsonValue('monthly')
  monthly,
  @JsonValue('everyOtherMonth')
  everyothermonth,
  @JsonValue('every3Months')
  every3months,
  @JsonValue('every4Months')
  every4months,
  @JsonValue('twiceAYear')
  twiceayear,
  @JsonValue('yearly')
  yearly,
  @JsonValue('everyOtherYear')
  everyotheryear
}

const $ScheduledTransactionSummaryFrequencyMap = {
  ScheduledTransactionSummaryFrequency.never: 'never',
  ScheduledTransactionSummaryFrequency.daily: 'daily',
  ScheduledTransactionSummaryFrequency.weekly: 'weekly',
  ScheduledTransactionSummaryFrequency.everyotherweek: 'everyOtherWeek',
  ScheduledTransactionSummaryFrequency.twiceamonth: 'twiceAMonth',
  ScheduledTransactionSummaryFrequency.every4weeks: 'every4Weeks',
  ScheduledTransactionSummaryFrequency.monthly: 'monthly',
  ScheduledTransactionSummaryFrequency.everyothermonth: 'everyOtherMonth',
  ScheduledTransactionSummaryFrequency.every3months: 'every3Months',
  ScheduledTransactionSummaryFrequency.every4months: 'every4Months',
  ScheduledTransactionSummaryFrequency.twiceayear: 'twiceAYear',
  ScheduledTransactionSummaryFrequency.yearly: 'yearly',
  ScheduledTransactionSummaryFrequency.everyotheryear: 'everyOtherYear',
  ScheduledTransactionSummaryFrequency.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown'
};

enum ScheduledTransactionSummaryFlagColor {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('red')
  red,
  @JsonValue('orange')
  orange,
  @JsonValue('yellow')
  yellow,
  @JsonValue('green')
  green,
  @JsonValue('blue')
  blue,
  @JsonValue('purple')
  purple,
  @JsonValue('null')
  $null
}

const $ScheduledTransactionSummaryFlagColorMap = {
  ScheduledTransactionSummaryFlagColor.red: 'red',
  ScheduledTransactionSummaryFlagColor.orange: 'orange',
  ScheduledTransactionSummaryFlagColor.yellow: 'yellow',
  ScheduledTransactionSummaryFlagColor.green: 'green',
  ScheduledTransactionSummaryFlagColor.blue: 'blue',
  ScheduledTransactionSummaryFlagColor.purple: 'purple',
  ScheduledTransactionSummaryFlagColor.$null: 'null',
  ScheduledTransactionSummaryFlagColor.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown'
};
