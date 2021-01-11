// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ynab.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Ynab extends Ynab {
  _$Ynab([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Ynab;

  @override
  Future<Response<UserResponse>> getUser() {
    final $url = '/user';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserResponse, UserResponse>($request);
  }

  @override
  Future<Response<BudgetSummaryResponse>> getBudgets({bool include_accounts}) {
    final $url = '/budgets';
    final $params = <String, dynamic>{'include_accounts': include_accounts};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BudgetSummaryResponse, BudgetSummaryResponse>($request);
  }

  @override
  Future<Response<BudgetDetailResponse>> getBudgetById(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BudgetDetailResponse, BudgetDetailResponse>($request);
  }

  @override
  Future<Response<BudgetSettingsResponse>> getBudgetSettingsById(
      {String budget_id}) {
    final $url = '/budgets/$budget_id/settings';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<BudgetSettingsResponse, BudgetSettingsResponse>($request);
  }

  @override
  Future<Response<AccountsResponse>> getAccounts(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/accounts';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<AccountsResponse, AccountsResponse>($request);
  }

  @override
  Future<Response<dynamic>> createAccount(
      {String budget_id, SaveAccountWrapper data}) {
    final $url = '/budgets/$budget_id/accounts';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AccountResponse>> getAccountById(
      {String budget_id, String account_id}) {
    final $url = '/budgets/$budget_id/accounts/$account_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<AccountResponse, AccountResponse>($request);
  }

  @override
  Future<Response<CategoriesResponse>> getCategories(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/categories';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<CategoriesResponse, CategoriesResponse>($request);
  }

  @override
  Future<Response<CategoryResponse>> getCategoryById(
      {String budget_id, String category_id}) {
    final $url = '/budgets/$budget_id/categories/$category_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CategoryResponse, CategoryResponse>($request);
  }

  @override
  Future<Response<CategoryResponse>> getMonthCategoryById(
      {String budget_id, String month, String category_id}) {
    final $url = '/budgets/$budget_id/months/$month/categories/$category_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CategoryResponse, CategoryResponse>($request);
  }

  @override
  Future<Response<SaveCategoryResponse>> updateMonthCategory(
      {String budget_id,
      String month,
      String category_id,
      SaveMonthCategoryWrapper data}) {
    final $url = '/budgets/$budget_id/months/$month/categories/$category_id';
    final $body = data;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<SaveCategoryResponse, SaveCategoryResponse>($request);
  }

  @override
  Future<Response<PayeesResponse>> getPayees(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/payees';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PayeesResponse, PayeesResponse>($request);
  }

  @override
  Future<Response<PayeeResponse>> getPayeeById(
      {String budget_id, String payee_id}) {
    final $url = '/budgets/$budget_id/payees/$payee_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PayeeResponse, PayeeResponse>($request);
  }

  @override
  Future<Response<PayeeLocationsResponse>> getPayeeLocations(
      {String budget_id}) {
    final $url = '/budgets/$budget_id/payee_locations';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<PayeeLocationsResponse, PayeeLocationsResponse>($request);
  }

  @override
  Future<Response<PayeeLocationResponse>> getPayeeLocationById(
      {String budget_id, String payee_location_id}) {
    final $url = '/budgets/$budget_id/payee_locations/$payee_location_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<PayeeLocationResponse, PayeeLocationResponse>($request);
  }

  @override
  Future<Response<PayeeLocationsResponse>> getPayeeLocationsByPayee(
      {String budget_id, String payee_id}) {
    final $url = '/budgets/$budget_id/payees/$payee_id/payee_locations';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<PayeeLocationsResponse, PayeeLocationsResponse>($request);
  }

  @override
  Future<Response<MonthSummariesResponse>> getBudgetMonths(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/months';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<MonthSummariesResponse, MonthSummariesResponse>($request);
  }

  @override
  Future<Response<MonthDetailResponse>> getBudgetMonth(
      {String budget_id, String month}) {
    final $url = '/budgets/$budget_id/months/$month';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MonthDetailResponse, MonthDetailResponse>($request);
  }

  @override
  Future<Response<TransactionsResponse>> getTransactions(
      {String budget_id,
      String since_date,
      String type,
      int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/transactions';
    final $params = <String, dynamic>{
      'since_date': since_date,
      'type': type,
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<TransactionsResponse, TransactionsResponse>($request);
  }

  @override
  Future<Response<dynamic>> createTransaction(
      {String budget_id, SaveTransactionsWrapper data}) {
    final $url = '/budgets/$budget_id/transactions';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateTransactions(
      {String budget_id, UpdateTransactionsWrapper data}) {
    final $url = '/budgets/$budget_id/transactions';
    final $body = data;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TransactionsImportResponse>> importTransactions(
      {String budget_id}) {
    final $url = '/budgets/$budget_id/transactions/import';
    final $request = Request('POST', $url, client.baseUrl);
    return client
        .send<TransactionsImportResponse, TransactionsImportResponse>($request);
  }

  @override
  Future<Response<TransactionResponse>> getTransactionById(
      {String budget_id, String transaction_id}) {
    final $url = '/budgets/$budget_id/transactions/$transaction_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<TransactionResponse, TransactionResponse>($request);
  }

  @override
  Future<Response<TransactionResponse>> updateTransaction(
      {String budget_id, String transaction_id, SaveTransactionWrapper data}) {
    final $url = '/budgets/$budget_id/transactions/$transaction_id';
    final $body = data;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<TransactionResponse, TransactionResponse>($request);
  }

  @override
  Future<Response<dynamic>> bulkCreateTransactions(
      {String budget_id, BulkTransactions transactions}) {
    final $url = '/budgets/$budget_id/transactions/bulk';
    final $body = transactions;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TransactionsResponse>> getTransactionsByAccount(
      {String budget_id,
      String account_id,
      String since_date,
      String type,
      int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/accounts/$account_id/transactions';
    final $params = <String, dynamic>{
      'since_date': since_date,
      'type': type,
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<TransactionsResponse, TransactionsResponse>($request);
  }

  @override
  Future<Response<HybridTransactionsResponse>> getTransactionsByCategory(
      {String budget_id,
      String category_id,
      String since_date,
      String type,
      int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/categories/$category_id/transactions';
    final $params = <String, dynamic>{
      'since_date': since_date,
      'type': type,
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<HybridTransactionsResponse, HybridTransactionsResponse>($request);
  }

  @override
  Future<Response<HybridTransactionsResponse>> getTransactionsByPayee(
      {String budget_id,
      String payee_id,
      String since_date,
      String type,
      int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/payees/$payee_id/transactions';
    final $params = <String, dynamic>{
      'since_date': since_date,
      'type': type,
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<HybridTransactionsResponse, HybridTransactionsResponse>($request);
  }

  @override
  Future<Response<ScheduledTransactionsResponse>> getScheduledTransactions(
      {String budget_id, int last_knowledge_of_server}) {
    final $url = '/budgets/$budget_id/scheduled_transactions';
    final $params = <String, dynamic>{
      'last_knowledge_of_server': last_knowledge_of_server
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ScheduledTransactionsResponse,
        ScheduledTransactionsResponse>($request);
  }

  @override
  Future<Response<ScheduledTransactionResponse>> getScheduledTransactionById(
      {String budget_id, String scheduled_transaction_id}) {
    final $url =
        '/budgets/$budget_id/scheduled_transactions/$scheduled_transaction_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<ScheduledTransactionResponse,
        ScheduledTransactionResponse>($request);
  }
}
