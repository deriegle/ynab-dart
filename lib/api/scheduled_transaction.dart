import 'base.dart';
import 'response.dart';

class ScheduledTransactionApi extends BaseApi {
  ScheduledTransactionApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getScheduledTransactions(String budgetId,
          [int lastKnowledgeOfServer]) =>
      makeRequest(
        path: '/v1/budgets/$budgetId/scheduled_transactions',
        lastKnowledgeOfServer: lastKnowledgeOfServer,
      );

  Future<YNABResponse> getScheduledTransaction(
          String budgetId, String scheduledTransactionId) =>
      makeRequest(
        path: '/v1/$budgetId/scheduled_transactions/$scheduledTransactionId',
      );
}
