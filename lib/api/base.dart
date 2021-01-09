import 'package:ynab/api/response.dart';
import 'package:http/http.dart' as http;

class Configuration {
  final String apiKey;
  final String basePath;

  Configuration(String accessToken, this.basePath)
      : apiKey = 'Bearer ${accessToken}';
}

const USER_AGENT = 'api_client/dart/0.0.1';

abstract class BaseApi {
  final Configuration _configuration;

  BaseApi(this._configuration);

  Configuration get configuration => _configuration;

  Future<YNABResponse> makeRequest(
    String path, [
    Map<String, String> queryParameters,
    Map<String, String> body,
    String method,
  ]) async {
    final uri = Uri(
      host: configuration.basePath,
      path: path,
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

    http.Response res;

    if (method == null || method.toUpperCase() == 'GET') {
      res = await http.get(
        uri.toString(),
        headers: headers,
      );
    } else if (method == 'POST') {
      res = await http.post(
        uri.toString(),
        body: body,
        headers: headers,
      );
    }

    return YNABResponse.fromResponse(res);
  }
}
