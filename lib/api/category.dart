import 'package:ynab/extensions/ynab_datetime.dart';
import 'package:meta/meta.dart';
import 'base.dart';
import 'response.dart';

class CategoryApi extends BaseApi {
  CategoryApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getCategories(
    String budgetId, {
    int lastKnowledgeOfServer,
  }) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/categories',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getCategory(String budgetId, String categoryId) =>
      makeRequest(path: '/v1/budgets/$budgetId/categories/$categoryId');

  Future<YNABResponse> getMonthCategory({
    @required String budgetId,
    @required DateTime month,
    @required String categoryId,
  }) =>
      makeRequest(
          path:
              '/v1/budgets/$budgetId/months/${month.toYNABFormat()}/categories/$categoryId');

  Future<YNABResponse> updateMonthCategory({
    @required String budgetId,
    @required String month,
    @required String categoryId,
    @required int budgeted,
  }) {
    if (budgeted == null) {
      throw ArgumentError.notNull('budgeted');
    }

    return makeRequest(
      path: '/v1/budgets/$budgetId/months/$month/categories/$categoryId',
      method: 'PATCH',
      body: {
        'budgeted': budgeted,
      },
    );
  }
}
