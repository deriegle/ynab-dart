import 'base.dart';
import 'response.dart';

class MonthApi extends BaseApi {
  MonthApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getMonths(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/months',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getPayeeById(String budgetId, String month) =>
      makeRequest(path: '/v1/$budgetId/months/$month');
}
