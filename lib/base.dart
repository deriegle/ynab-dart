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
}
