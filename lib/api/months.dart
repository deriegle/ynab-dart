import 'base.dart';
import 'package:ynab/extensions/ynab_datetime.dart';
import 'response.dart';

class MonthsApi extends BaseApi {
  MonthsApi(Configuration configuration) : super(configuration);

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

    return makeRequest(
      path: '/v1/budgets/$budgetId/months/${firstOfMonthDate.toYNABFormat()}',
      lastKnowledgeOfServer: lastKnowledgeOfServer,
    );
  }
}
