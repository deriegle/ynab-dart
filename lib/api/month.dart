import 'base.dart';
import 'response.dart';

class MonthApi extends BaseApi {
  MonthApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getMonths(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        '/v1/budgets/$budgetId/months',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getPayeeById(String budgetId, String month) =>
      makeRequest('/v1/$budgetId/months/$month');
}
