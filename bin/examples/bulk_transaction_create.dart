import 'package:ynab/models/transaction.dart';
import 'package:ynab/ynab.dart';

import 'example_config.dart';

void main() async {
  final ynabApi = YNABClient(YNAB_EXAMPLE_ACCESS_TOKEN);
  final budgetsResponse =
      await ynabApi.budget.getBudgets(includeAccounts: true);

  final budget = budgetsResponse.data['budgets'].last;
  final accountId = budgetsResponse.data['accounts'].first['id'];

  await ynabApi.transaction.createTransactions(
    budget['id'],
    transactions: [
      Transaction(
        accountId: accountId,
        date: DateTime.now(),
        amount: -50000,
        memo: 'Refund for Kitchen Supplies',
      ),
      Transaction(
        accountId: accountId,
        categoryId: '75655c30-ab05-4533-ae4b-8d958e02e73c',
        payeeId: 'c8aaf97d-eca5-4d5e-a583-e4043758f953',
        cleared: TransactionClearedStatus.cleared,
        approved: true,
        date: DateTime.now(),
        amount: -23430,
        memo: 'Dry Cleaning',
      ),
      Transaction(
        accountId: accountId,
        categoryId: '3e0de9e2-b2eb-462d-bc71-a77a864d2d3b',
        date: DateTime.now(),
        amount: 1000000,
        memo: 'Income',
      ),
    ],
  );
}
