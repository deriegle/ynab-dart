import 'package:ynab/ynab.dart';

void main(List<String> arguments) async {
  final ynab = YNABClient(
    '1a4a5a850e217a8aba0279e4ee64af03fc968a594c0864e18cb94397580ebaa0',
  );

  final res = await ynab.budget.getBudgets();

  if (res.isSuccess) {
    print(res.data);
  } else {
    print('error');
    print(res.error);
  }
}
