import 'base.dart';
import 'package:meta/meta.dart';
import 'response.dart';

class AccountApi extends BaseApi {
  AccountApi(Configuration configuration) : super(configuration);

  Future<YNABResponse> getAccounts(
    String budgetId, [
    int lastKnowledgeOfServer,
  ]) =>
      makeRequest(
        '/v1/budgets/$budgetId/accounts',
        lastKnowledgeOfServer == null
            ? null
            : {'last_knowledge_of_server': lastKnowledgeOfServer.toString()},
      );

  Future<YNABResponse> getAccountById(String budgetId, String accountId) =>
      makeRequest('/v1/budgets/$budgetId/accounts/$accountId');

  Future<YNABResponse> createAccount(
    String budgetId, {
    @required String name,
    @required int balance,
    @required AccountType type,
  }) {
    final body = Map<String, String>.from({
      'account': {
        'name': name,
        'balance': balance.toString(),
        'type': type.name,
      }
    });

    return makeRequest(
      '/v1/budgets/$budgetId/accounts',
      null,
      body,
    );
  }
}

enum AccountType {
  Checking,
  Savings,
  CreditCard,
  Cash,
  LineOfCredit,
  OtherAsset,
  OtherLiability,
}

extension AccountTypeName on AccountType {
  String get name {
    switch (this) {
      case AccountType.Checking:
        return 'checking';
      case AccountType.Savings:
        return 'savings';
      case AccountType.CreditCard:
        return 'creditCard';
      case AccountType.Cash:
        return 'cash';
      case AccountType.LineOfCredit:
        return 'lineOfCredit';
      case AccountType.OtherAsset:
        return 'otherAsset';
      case AccountType.OtherLiability:
        return 'otherLiability';
      default:
        throw UnimplementedError('Invalid account type: $this');
    }
  }
}
