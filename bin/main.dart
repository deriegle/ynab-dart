import 'package:ynab/ynab.dart';
import 'examples/example_config.dart';
import 'package:ynab/generated/client_index.dart';

void main(List<String> arguments) async {
  final ynab = YNABClient(YNAB_EXAMPLE_ACCESS_TOKEN);
  // final res = await ynab.budget.getBudgets();

  // if (res.isSuccess) {
  //   print(res.data);
  // } else {
  //   print('error');
  //   print(res.error);
  // }

  // final ynab = Ynab.create();
  // final res = await ynab.getAccounts(budget_id: '1234');
}
