import 'package:ynab/ynab.dart';
import 'examples/example_config.dart';

void main(List<String> arguments) async {
  final ynab = YNABClient(YNAB_EXAMPLE_ACCESS_TOKEN);
  final res = await ynab.budget.getBudgets();

  if (res.isSuccess) {
    print(res.data);
  } else {
    print('error');
    print(res.error);
  }
}
