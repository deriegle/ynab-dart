import 'base.dart';
import 'response.dart';

class BudgetApi extends BaseApi {
  BudgetApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getBudgetById(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        '/v1/budgets/$budgetId',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getBudgets([bool includeAccounts = false]) =>
      makeRequest('/v1/budgets', {
        'include_accounts': includeAccounts.toString(),
      });

  Future<YNABResponse> getBudgetSettingsById(String budgetId) =>
      makeRequest('/v1/budgets/$budgetId/settings');
}
