import 'base.dart';
import 'response.dart';

class TransactionApi extends BaseApi {
  TransactionApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getTransactions(String budgetId,
          [int lastKnowledgeOfServer]) =>
      makeRequest(
        '/v1/budgets/$budgetId/transactions',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getTransaction(String budgetId, String transactionId) =>
      makeRequest('/v1/budgets/$budgetId/transactions/$transactionId');

  Future<YNABResponse> getAccountTransactions(
          String budgetId, String accountId) =>
      makeRequest('/v1/budgets/$budgetId/accounts/$accountId/transactions');

  Future<YNABResponse> getCategoryTransactions(
          String budgetId, String categoryId) =>
      makeRequest('/v1/budgets/$budgetId/categories/$categoryId/transactions');

  Future<YNABResponse> getPayeeTransactions(String budgetId, String payeeId) =>
      makeRequest('/v1/budgets/$budgetId/payees/$payeeId/transactions');

// Make this work with PUT request and accept data to update
  Future<YNABResponse> updateTransaction(
          String budgetId, String transactionId) =>
      makeRequest('/v1/budgets/$budgetId/transactions/$transactionId');

// Make this work with POST request and accept data to create
  Future<YNABResponse> createTransaction(String budgetId) =>
      makeRequest('/v1/budgets/$budgetId/transactions');

// Make this work with PATCH request and accept data to update
  Future<YNABResponse> updateTransactions(String budgetId) =>
      makeRequest('/v1/budgets/$budgetId/transactions');

// Make this work with POST request
  Future<YNABResponse> importTransactions(String budgetId) =>
      makeRequest('/v1/budgets/$budgetId/transactions/import');
}
