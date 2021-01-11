import 'base.dart';
import 'response.dart';

class PayeesApi extends BaseApi {
  PayeesApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getPayees(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/payees',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getPayeeById(String budgetId, String payeeId) =>
      makeRequest(path: '/v1/budgets/$budgetId/payees/$payeeId');
}
