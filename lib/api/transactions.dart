import 'package:ynab/models/transaction.dart';

import 'base.dart';
import 'response.dart';

class TransactionsApi extends BaseApi {
  TransactionsApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getTransactions(String budgetId,
          [int lastKnowledgeOfServer]) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/transactions',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getTransaction(String budgetId, String transactionId) =>
      makeRequest(path: '/v1/budgets/$budgetId/transactions/$transactionId');

  Future<YNABResponse> getAccountTransactions(
          String budgetId, String accountId) =>
      makeRequest(
          path: '/v1/budgets/$budgetId/accounts/$accountId/transactions');

  Future<YNABResponse> getCategoryTransactions(
          String budgetId, String categoryId) =>
      makeRequest(
          path: '/v1/budgets/$budgetId/categories/$categoryId/transactions');

  Future<YNABResponse> getPayeeTransactions(String budgetId, String payeeId) =>
      makeRequest(path: '/v1/budgets/$budgetId/payees/$payeeId/transactions');

  Future<YNABResponse> createTransaction(
    String budgetId, {
    Transaction transaction,
  }) {
    if (transaction == null) {
      throw ArgumentError.notNull('transaction');
    }

    return makeRequest(
      path: '/v1/budgets/$budgetId/transactions',
      method: 'POST',
      body: {'transaction': transaction},
    );
  }

  Future<YNABResponse> createTransactions(
    String budgetId, {
    List<Transaction> transactions,
  }) {
    if (transactions == null) {
      throw ArgumentError.notNull('transactions');
    }

    return makeRequest(
      path: '/v1/budgets/$budgetId/transactions',
      method: 'POST',
      body: {'transactions': transactions},
    );
  }

  Future<YNABResponse> updateTransactions(
    String budgetId,
    List<Transaction> transactions,
  ) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/transactions',
        body: {'transactions': transactions},
        method: 'PATCH',
      );

  Future<YNABResponse> updateTransaction(
    String budgetId,
    String transactionId,
    Transaction transaction,
  ) =>
      makeRequest(
          path: '/v1/budgets/$budgetId/transactions/$transactionId',
          body: {'transaction': transaction},
          method: 'PUT');

  Future<YNABResponse> importTransactions(String budgetId) => makeRequest(
      path: '/v1/budgets/$budgetId/transactions/import', method: 'POST');
}
