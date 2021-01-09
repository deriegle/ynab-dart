import 'package:http/http.dart' as http;
import 'package:ynab/base.dart';

import 'package:ynab/response.dart';

class UserApi extends BaseApi {
  UserApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getUser() async {
    final uri = Uri(
      host: configuration.basePath,
      path: '/v1/user',
      scheme: 'https',
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
}

class YNABClient {
  final Configuration _configuration;

  YNABClient(String accessToken,
      [String endpointUrl = 'api.youneedabudget.com'])
      : _configuration = Configuration(accessToken, endpointUrl);

  UserApi get user => UserApi(_configuration);

  // userApi
  // budgetsApi
  // accountsApi
  // categoriesApi
  // monthsApi
  // payeesApi
  // payeeLocationsApi
  // transactionsApi
  // scheduledTransactionsApi
}
