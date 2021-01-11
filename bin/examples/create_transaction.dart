import 'package:ynab/ynab.dart';

import 'example_config.dart';

void main() async {
  final ynabApi = YNABClient(YNAB_EXAMPLE_ACCESS_TOKEN);
  final budgetsResponse = await ynabApi.budgets.getBudgets();

  if (budgetsResponse.isError) {
    return print('ERROR ${budgetsResponse.error}');
  }

  print('This user has ${budgetsResponse.data['budgets'].length} budgets.');

  print('===========');
  print('BUDGET LIST');
  print('===========');

  for (final budget in budgetsResponse.data['budgets']) {
    print(
      '[id: ${budget['id']}, name: ${budget['name']}, last_modified_on: ${budget['last_modified_on']}]',
    );
  }
}
