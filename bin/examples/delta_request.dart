import 'package:ynab/ynab.dart';

void main() async {
  const accessToken = 'ccbb2db8-7c1b-not-real-b755-784876927790';
  final ynabApi = YNABClient(accessToken);
  final budgetsResponse = await ynabApi.budget.getBudgets();

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
