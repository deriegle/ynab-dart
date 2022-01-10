import 'dart:convert' show jsonEncode;
import 'package:ynab/api/response.dart';
import 'package:meta/meta.dart';
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

  Future<YNABResponse> makeRequest({
    @required String path,
    Map<String, String> query = const {},
    Map<String, dynamic> body = const {},
    int lastKnowledgeOfServer,
    String method = 'GET',
  }) async {
    final uri = Uri(
      host: configuration.basePath,
      path: path,
      scheme: 'https',
      queryParameters: lastKnowledgeOfServer == null
          ? query
          : {
              ...query,
              'last_knowledge_of_server': lastKnowledgeOfServer.toString(),
            },
    );

    if (configuration.apiKey == null || configuration.apiKey.isEmpty) {
      return Future.error('Not authorized');
    }

    final headers = {
      'Accept': 'application/json',
      'User-Agent': USER_AGENT,
      'Authorization': configuration.apiKey,
    };

    final bodyPayloadHeaders = {
      ...headers,
      'Content-Type': 'application/json',
    };

    print('[$method] ${uri.toString()}');

    http.Response res;

    if (method == null || method.toUpperCase() == 'GET') {
      res = await http.get(
        uri.toString(),
        headers: headers,
      );
    } else if (method == 'POST') {
      res = await http.post(
        uri.toString(),
        body: jsonEncode(body ?? {}),
        headers: bodyPayloadHeaders,
      );
    } else if (method == 'PATCH') {
      res = await http.patch(
        uri.toString(),
        body: jsonEncode(body ?? {}),
        headers: bodyPayloadHeaders,
      );
    }

    // print('[${res.statusCode}]');

    return YNABResponse.fromResponse(res);
  }
}
