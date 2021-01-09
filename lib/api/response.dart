import 'dart:convert' show jsonDecode;
import 'package:meta/meta.dart';
import 'package:http/http.dart' show Response;

class YNABResponse {
  final int statusCode;
  final String bodyString;
  final Map<String, String> headers;
  final Map<String, Map<String, dynamic>> _cache = {};

  YNABResponse({
    @required this.statusCode,
    @required this.bodyString,
    this.headers = const {},
  });

  bool get rateLimited => statusCode == 429;
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
  bool get isError => !isSuccess;

  int get rateLimitMax {
    final rateLimit = headers['x-rate-limit'];

    if (rateLimit == null || rateLimit.isEmpty) {
      return null;
    }

    return int.tryParse(rateLimit.split('/').last);
  }

  int get rateLimitCount {
    final rateLimit = headers['x-rate-limit'];

    if (rateLimit == null || rateLimit.isEmpty) {
      return null;
    }

    return int.tryParse(rateLimit.split('/').first);
  }

  Map<String, dynamic> get data => parse('data');
  Map<String, dynamic> get error => parse('error');

  Map<String, dynamic> parse(String key) {
    try {
      if (_cache[key] != null) {
        return _cache[key];
      }

      final json = jsonDecode(bodyString);
      final data = Map<String, dynamic>.from(json[key]);

      _cache[key] = data;

      return data;
    } catch (err) {
      print('err parsing or something');
      print(err);
      return null;
    }
  }

  static YNABResponse fromResponse(Response res) => YNABResponse(
        statusCode: res.statusCode,
        bodyString: res.body,
        headers: res.headers,
      );
}
