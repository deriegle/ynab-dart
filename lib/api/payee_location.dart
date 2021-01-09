import 'base.dart';
import 'response.dart';

class PayeeLocationApi extends BaseApi {
  PayeeLocationApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getPayeeLocations(String budgetId) =>
      makeRequest(path: '/v1/budgets/$budgetId/payee_locations');

  Future<YNABResponse> getPayeeLocationById(
          String budgetId, String payeeLocationId) =>
      makeRequest(path: '/v1/$budgetId/payee_locations/$payeeLocationId');

  Future<YNABResponse> getPayeeLocationsByPayee(
          String budgetId, String payeeId) =>
      makeRequest(path: '/v1/$budgetId/payees/$payeeId/payee_locations');
}
