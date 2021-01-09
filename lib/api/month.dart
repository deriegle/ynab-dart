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

  Future<YNABResponse> getBudgetMonth(
    String budgetId,
    DateTime month, [
    int lastKnowledgeOfServer,
  ]) {
    final formattedMonth = month.toIso8601String().substring(0, 10);

    return makeRequest(
      path: '/v1/budgets/$budgetId/months/$formattedMonth',
      lastKnowledgeOfServer: lastKnowledgeOfServer,
    );
  }
}
