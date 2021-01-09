import 'base.dart';
import 'response.dart';

class UserApi extends BaseApi {
  UserApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getUser() => makeRequest(path: '/v1/user');
}
