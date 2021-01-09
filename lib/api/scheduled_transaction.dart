import 'base.dart';
import 'response.dart';

class ScheduledTransactionApi extends BaseApi {
  ScheduledTransactionApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getScheduledTransactions(String budgetId,
          [int lastKnowledgeOfServer]) =>
      makeRequest(
        '/v1/budgets/$budgetId/scheduled_transactions',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getScheduledTransaction(
          String budgetId, String scheduledTransactionId) =>
      makeRequest(
          '/v1/$budgetId/scheduled_transactions/$scheduledTransactionId');
}
