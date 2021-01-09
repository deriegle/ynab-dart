import 'package:ynab/api/base.dart';
import 'package:ynab/api/budget.dart';
import 'package:ynab/api/user.dart';

class YNABClient {
  final Configuration _configuration;

  YNABClient(String accessToken,
      [String endpointUrl = 'api.youneedabudget.com'])
      : _configuration = Configuration(accessToken, endpointUrl);

  UserApi get user => UserApi(_configuration);
  BudgetApi get budget => BudgetApi(_configuration);

  // accountsApi
  // categoriesApi
  // monthsApi
  // payeesApi
  // payeeLocationsApi
  // transactionsApi
  // scheduledTransactionsApi
}
