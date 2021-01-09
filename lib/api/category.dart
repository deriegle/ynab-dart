import 'base.dart';
import 'response.dart';

class CategoryApi extends BaseApi {
  CategoryApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getCategories(String budgetId,
          [int lastKnowledgeOfServer]) =>
      makeRequest(
        '/v1/budgets/$budgetId/categories',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getCategory(String budgetId, String categoryId) =>
      makeRequest('/v1/$budgetId/categories/$categoryId');

  Future<YNABResponse> getMonthCategory(
          String budgetId, String month, String categoryId) =>
      makeRequest('/v1/$budgetId/months/$month/categories/$categoryId');

// NEED TO UPDATE makeRequest to work better
  Future<YNABResponse> updateMonthCategory(
          String budgetId, String month, String categoryId, int budgeted) =>
      makeRequest('/v1/$budgetId/months/$month/categories/$categoryId');
}
