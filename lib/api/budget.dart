import 'base.dart';
import 'response.dart';

class BudgetApi extends BaseApi {
  BudgetApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getBudgetById(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        path: '/v1/budgets/$budgetId',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getBudgets({bool includeAccounts = false}) =>
      makeRequest(
        path: '/v1/budgets',
        query: {'include_accounts': includeAccounts.toString()},
      );

  Future<YNABResponse> getBudgetSettingsById(String budgetId) =>
      makeRequest(path: '/v1/budgets/$budgetId/settings');
}
