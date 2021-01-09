import 'package:ynab/api/account.dart';
import 'dart:math' as math;
import 'package:ynab/api/base.dart';
import 'package:ynab/api/budget.dart';
import 'package:ynab/api/category.dart';
import 'package:ynab/api/month.dart';
import 'package:ynab/api/payee.dart';
import 'package:ynab/api/payee_location.dart';
import 'package:ynab/api/scheduled_transaction.dart';
import 'package:ynab/api/transaction.dart';
import 'package:ynab/api/user.dart';

export 'models/transaction.dart';

class YNABClient {
  final Configuration _configuration;

  YNABClient(
    String accessToken, [
    String endpointUrl = 'api.youneedabudget.com',
  ]) : _configuration = Configuration(accessToken, endpointUrl);

  UserApi get user => UserApi(_configuration);
  BudgetApi get budget => BudgetApi(_configuration);
  AccountApi get account => AccountApi(_configuration);
  PayeeApi get payee => PayeeApi(_configuration);
  MonthApi get month => MonthApi(_configuration);
  PayeeLocationApi get payeeLocation => PayeeLocationApi(_configuration);
  ScheduledTransactionApi get scheduledTransaction =>
      ScheduledTransactionApi(_configuration);
  CategoryApi get category => CategoryApi(_configuration);
  TransactionApi get transaction => TransactionApi(_configuration);

  double convertMilliUnitsToCurrencyAmount(int milliunits,
      [int currencyDecimalDigits = 2]) {
    var numberToRoundTo = math.pow(10, 3 - math.min(3, currencyDecimalDigits));
    numberToRoundTo = 1 / numberToRoundTo;

    final rounded = (milliunits * numberToRoundTo).round() / numberToRoundTo;
    final currencyAmount = rounded * (0.1 / math.pow(10, 2));

    return double.tryParse(
      currencyAmount.toStringAsFixed(currencyDecimalDigits),
    );
  }
}
