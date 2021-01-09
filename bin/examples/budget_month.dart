import 'package:ynab/ynab.dart';

import 'example_config.dart';

void main() async {
  final ynabApi = YNABClient(YNAB_EXAMPLE_ACCESS_TOKEN);
  final budgetsResponse = await ynabApi.budget.getBudgets();

  if (budgetsResponse.isError) {
    return print('ERROR ${budgetsResponse.error}');
  }

  final budgetId = budgetsResponse.data['budgets'].first['id'];
  final budgetMonthResponse =
      await ynabApi.month.getBudgetMonth(budgetId, DateTime.now());

  if (budgetMonthResponse.isError) {
    return print('ERROR ${budgetMonthResponse.error}');
  }

  final month = budgetMonthResponse.data['month'];

  print('============');
  print('BUDGET MONTH');
  print('============');

  print('Month: ${month['month']}');
  print('Note: ${month['note'] ?? ''}');
  print('Age of Money: ${month['age_of_money']}');
  print('Category Balances:');

  for (final category in month['categories']) {
    print(
      '\t\t${category['name']} - ${ynabApi.convertMilliUnitsToCurrencyAmount(category['balance']).toStringAsFixed(2)}',
    );
  }
}
