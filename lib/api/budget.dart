import 'base.dart';
import 'response.dart';
import 'package:http/http.dart' as http;

class BudgetApi extends BaseApi {
  BudgetApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getBudgetById(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) async {
    final queryParameters = {};

    if (lastKnowledgeOfServer != null) {
      queryParameters['last_knowledge_of_server'] = lastKnowledgeOfServer;
    }

    final uri = Uri(
      host: configuration.basePath,
      path: '/v1/budgets/$budgetId',
      scheme: 'https',
      queryParameters: queryParameters,
    );

    if (configuration.apiKey == null || configuration.apiKey.isEmpty) {
      return Future.error('Not authorized');
    }

    final headers = {
      'Accept': 'application/json',
      'User-Agent': USER_AGENT,
      'Authorization': configuration.apiKey,
    };

    final res = await http.get(
      uri.toString(),
      headers: headers,
    );

    return YNABResponse.fromResponse(res);
  }

  Future<YNABResponse> getBudgets([bool includeAccounts = false]) async {
    final uri = Uri(
        host: configuration.basePath,
        path: '/v1/budgets',
        scheme: 'https',
        queryParameters: {
          'include_accounts': includeAccounts.toString(),
        });

    if (configuration.apiKey == null || configuration.apiKey.isEmpty) {
      return Future.error('Not authorized');
    }

    final headers = {
      'Accept': 'application/json',
      'User-Agent': USER_AGENT,
      'Authorization': configuration.apiKey,
    };

    final res = await http.get(
      uri.toString(),
      headers: headers,
    );

    return YNABResponse.fromResponse(res);
  }

  Future<YNABResponse> getBudgetSettingsById(String budgetId) async {
    final uri = Uri(
      host: configuration.basePath,
      path: '/v1/budgets/$budgetId/settings',
      scheme: 'https',
    );

    final headers = {
      'Accept': 'application/json',
      'User-Agent': USER_AGENT,
      'Authorization': configuration.apiKey,
    };

    final res = await http.get(
      uri.toString(),
      headers: headers,
    );

    return YNABResponse.fromResponse(res);
  }
}
