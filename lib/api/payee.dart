import 'base.dart';
import 'response.dart';

class PayeeApi extends BaseApi {
  PayeeApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getPayees(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        '/v1/budgets/$budgetId/payees',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getPayeeById(String budgetId, String payeeId) =>
      makeRequest('/v1/$budgetId/payees/$payeeId');
}
