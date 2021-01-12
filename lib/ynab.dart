import 'dart:math' as math;
import 'package:ynab/api/accounts.dart';
import 'package:ynab/api/base.dart';
import 'package:ynab/api/budgets.dart';
import 'package:ynab/api/categories.dart';
import 'package:ynab/api/months.dart';
import 'package:ynab/api/payee_locations.dart';
import 'package:ynab/api/payees.dart';
import 'package:ynab/api/scheduled_transactions.dart';
import 'package:ynab/api/transactions.dart';
import 'package:ynab/api/user.dart';

export 'models/transaction.dart';

class YNABClient {
  final Configuration _configuration;

  YNABClient(
    String accessToken, [
    String endpointUrl = 'api.youneedabudget.com',
  ]) : _configuration = Configuration(accessToken, endpointUrl);

  UserApi get user => UserApi(_configuration);
  BudgetsApi get budgets => BudgetsApi(_configuration);
  AccountsApi get accounts => AccountsApi(_configuration);
  PayeesApi get payees => PayeesApi(_configuration);
  MonthsApi get months => MonthsApi(_configuration);
  PayeeLocationsApi get payeeLocations => PayeeLocationsApi(_configuration);
  ScheduledTransactionsApi get scheduledTransactions =>
      ScheduledTransactionsApi(_configuration);
  CategoriesApi get categories => CategoriesApi(_configuration);
  TransactionsApi get transactions => TransactionsApi(_configuration);

  static double convertMilliUnitsToCurrencyAmount(
    int milliunits, [
    int currencyDecimalDigits = 2,
  ]) {
    var numberToRoundTo = math.pow(10, 3 - math.min(3, currencyDecimalDigits));
    numberToRoundTo = 1 / numberToRoundTo;

    final rounded = (milliunits * numberToRoundTo).round() / numberToRoundTo;
    final currencyAmount = rounded * (0.1 / math.pow(10, 2));

    return double.tryParse(
      currencyAmount.toStringAsFixed(currencyDecimalDigits),
    );
  }
}
