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
    DateTime date, [
    int lastKnowledgeOfServer,
  ]) {
    final firstOfMonthDate = DateTime(date.year, date.month, 1);
    final formattedMonth = firstOfMonthDate.toIso8601String().substring(0, 10);

    return makeRequest(
      path: '/v1/budgets/$budgetId/months/$formattedMonth',
      lastKnowledgeOfServer: lastKnowledgeOfServer,
    );
  }
}
