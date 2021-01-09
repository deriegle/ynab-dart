import 'base.dart';
import 'response.dart';
import 'package:http/http.dart' as http;

class BudgetApi extends BaseApi {
  BudgetApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getBudgetById(
      String budgetId, int lastKnowledgeOfServer) {}

  Future<YNABResponse> getBudgetSettingsById(String budgetId) {}
  Future<YNABResponse> getBudgets(bool includeAccounts) {}
}
