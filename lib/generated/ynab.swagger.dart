import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'ynab.enums.swagger.dart' as enums;

part 'ynab.swagger.chopper.dart';
part 'ynab.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Ynab extends ChopperService {
  static Ynab create([ChopperClient client]) {
    if (client != null) {
      return _$Ynab(client);
    }

    final newClient = ChopperClient(
      services: [_$Ynab()],
      converter: JsonSerializableConverter(),
      baseUrl: 'https://api.youneedabudget.com/v1',
    );

    return _$Ynab(newClient);
  }

  ///User info

  @Get(path: '/user')
  Future<chopper.Response<UserResponse>> getUser();

  ///List budgets
  ///@param include_accounts Whether to include the list of budget accounts

  @Get(path: '/budgets')
  Future<chopper.Response<BudgetSummaryResponse>> getBudgets(
      {@Query('include_accounts') bool include_accounts});

  ///Single budget
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}')
  Future<chopper.Response<BudgetDetailResponse>> getBudgetById(
      {@Path('budget_id') @required String budget_id,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Budget Settings
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).

  @Get(path: '/budgets/{budget_id}/settings')
  Future<chopper.Response<BudgetSettingsResponse>> getBudgetSettingsById(
      {@Path('budget_id') @required String budget_id});

  ///Account list
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/accounts')
  Future<chopper.Response<AccountsResponse>> getAccounts(
      {@Path('budget_id') @required String budget_id,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Create a new account
  ///@param budget_id The id of the budget ("last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
  ///@param data The account to create.

  @Post(path: '/budgets/{budget_id}/accounts')
  Future<chopper.Response> createAccount(
      {@Path('budget_id') @required String budget_id,
      @Body() @required SaveAccountWrapper data});

  ///Single account
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param account_id The id of the account

  @Get(path: '/budgets/{budget_id}/accounts/{account_id}')
  Future<chopper.Response<AccountResponse>> getAccountById(
      {@Path('budget_id') @required String budget_id,
      @Path('account_id') @required String account_id});

  ///List categories
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/categories')
  Future<chopper.Response<CategoriesResponse>> getCategories(
      {@Path('budget_id') @required String budget_id,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Single category
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param category_id The id of the category

  @Get(path: '/budgets/{budget_id}/categories/{category_id}')
  Future<chopper.Response<CategoryResponse>> getCategoryById(
      {@Path('budget_id') @required String budget_id,
      @Path('category_id') @required String category_id});

  ///Single category for a specific budget month
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param month The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))
  ///@param category_id The id of the category

  @Get(path: '/budgets/{budget_id}/months/{month}/categories/{category_id}')
  Future<chopper.Response<CategoryResponse>> getMonthCategoryById(
      {@Path('budget_id') @required String budget_id,
      @Path('month') @required String month,
      @Path('category_id') @required String category_id});

  ///Update a category for a specific month
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param month The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))
  ///@param category_id The id of the category
  ///@param data The category to update.  Only `budgeted` amount can be updated and any other fields specified will be ignored.

  @Patch(path: '/budgets/{budget_id}/months/{month}/categories/{category_id}')
  Future<chopper.Response<SaveCategoryResponse>> updateMonthCategory(
      {@Path('budget_id') @required String budget_id,
      @Path('month') @required String month,
      @Path('category_id') @required String category_id,
      @Body() @required SaveMonthCategoryWrapper data});

  ///List payees
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/payees')
  Future<chopper.Response<PayeesResponse>> getPayees(
      {@Path('budget_id') @required String budget_id,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Single payee
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param payee_id The id of the payee

  @Get(path: '/budgets/{budget_id}/payees/{payee_id}')
  Future<chopper.Response<PayeeResponse>> getPayeeById(
      {@Path('budget_id') @required String budget_id,
      @Path('payee_id') @required String payee_id});

  ///List payee locations
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).

  @Get(path: '/budgets/{budget_id}/payee_locations')
  Future<chopper.Response<PayeeLocationsResponse>> getPayeeLocations(
      {@Path('budget_id') @required String budget_id});

  ///Single payee location
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param payee_location_id id of payee location

  @Get(path: '/budgets/{budget_id}/payee_locations/{payee_location_id}')
  Future<chopper.Response<PayeeLocationResponse>> getPayeeLocationById(
      {@Path('budget_id') @required String budget_id,
      @Path('payee_location_id') @required String payee_location_id});

  ///List locations for a payee
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param payee_id id of payee

  @Get(path: '/budgets/{budget_id}/payees/{payee_id}/payee_locations')
  Future<chopper.Response<PayeeLocationsResponse>> getPayeeLocationsByPayee(
      {@Path('budget_id') @required String budget_id,
      @Path('payee_id') @required String payee_id});

  ///List budget months
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/months')
  Future<chopper.Response<MonthSummariesResponse>> getBudgetMonths(
      {@Path('budget_id') @required String budget_id,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Single budget month
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param month The budget month in ISO format (e.g. 2016-12-01) ("current" can also be used to specify the current calendar month (UTC))

  @Get(path: '/budgets/{budget_id}/months/{month}')
  Future<chopper.Response<MonthDetailResponse>> getBudgetMonth(
      {@Path('budget_id') @required String budget_id,
      @Path('month') @required String month});

  ///List transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
  ///@param type If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported.
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/transactions')
  Future<chopper.Response<TransactionsResponse>> getTransactions(
      {@Path('budget_id') @required String budget_id,
      @Query('since_date') String since_date,
      @Query('type') String type,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Create a single transaction or multiple transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param data The transaction or transactions to create.  To create a single transaction you can specify a value for the `transaction` object and to create multiple transactions you can specify an array of `transactions`.  It is expected that you will only provide a value for one of these objects.

  @Post(path: '/budgets/{budget_id}/transactions')
  Future<chopper.Response> createTransaction(
      {@Path('budget_id') @required String budget_id,
      @Body() @required SaveTransactionsWrapper data});

  ///Update multiple transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param data The transactions to update. Each transaction must have either an `id` or `import_id` specified. If `id` is specified as null an `import_id` value can be provided which will allow transaction(s) to be updated by their `import_id`. If an `id` is specified, it will always be used for lookup.

  @Patch(path: '/budgets/{budget_id}/transactions')
  Future<chopper.Response> updateTransactions(
      {@Path('budget_id') @required String budget_id,
      @Body() @required UpdateTransactionsWrapper data});

  ///Import transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).

  @Post(path: '/budgets/{budget_id}/transactions/import')
  Future<chopper.Response<TransactionsImportResponse>> importTransactions(
      {@Path('budget_id') @required String budget_id});

  ///Single transaction
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param transaction_id The id of the transaction

  @Get(path: '/budgets/{budget_id}/transactions/{transaction_id}')
  Future<chopper.Response<TransactionResponse>> getTransactionById(
      {@Path('budget_id') @required String budget_id,
      @Path('transaction_id') @required String transaction_id});

  ///Updates an existing transaction
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param transaction_id The id of the transaction
  ///@param data The transaction to update

  @Put(path: '/budgets/{budget_id}/transactions/{transaction_id}')
  Future<chopper.Response<TransactionResponse>> updateTransaction(
      {@Path('budget_id') @required String budget_id,
      @Path('transaction_id') @required String transaction_id,
      @Body() @required SaveTransactionWrapper data});

  ///Bulk create transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param transactions The list of transactions to create

  @Post(path: '/budgets/{budget_id}/transactions/bulk')
  Future<chopper.Response> bulkCreateTransactions(
      {@Path('budget_id') @required String budget_id,
      @Body() @required BulkTransactions transactions});

  ///List account transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param account_id The id of the account
  ///@param since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
  ///@param type If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported.
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/accounts/{account_id}/transactions')
  Future<chopper.Response<TransactionsResponse>> getTransactionsByAccount(
      {@Path('budget_id') @required String budget_id,
      @Path('account_id') @required String account_id,
      @Query('since_date') String since_date,
      @Query('type') String type,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///List category transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param category_id The id of the category
  ///@param since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
  ///@param type If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported.
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/categories/{category_id}/transactions')
  Future<chopper.Response<HybridTransactionsResponse>>
      getTransactionsByCategory(
          {@Path('budget_id') @required String budget_id,
          @Path('category_id') @required String category_id,
          @Query('since_date') String since_date,
          @Query('type') String type,
          @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///List payee transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param payee_id The id of the payee
  ///@param since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
  ///@param type If specified, only transactions of the specified type will be included. "uncategorized" and "unapproved" are currently supported.
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/payees/{payee_id}/transactions')
  Future<chopper.Response<HybridTransactionsResponse>> getTransactionsByPayee(
      {@Path('budget_id') @required String budget_id,
      @Path('payee_id') @required String payee_id,
      @Query('since_date') String since_date,
      @Query('type') String type,
      @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///List scheduled transactions
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since `last_knowledge_of_server` will be included.

  @Get(path: '/budgets/{budget_id}/scheduled_transactions')
  Future<chopper.Response<ScheduledTransactionsResponse>>
      getScheduledTransactions(
          {@Path('budget_id') @required String budget_id,
          @Query('last_knowledge_of_server') int last_knowledge_of_server});

  ///Single scheduled transaction
  ///@param budget_id The id of the budget. "last-used" can be used to specify the last used budget and "default" can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget).
  ///@param scheduled_transaction_id The id of the scheduled transaction

  @Get(
      path:
          '/budgets/{budget_id}/scheduled_transactions/{scheduled_transaction_id}')
  Future<chopper.Response<ScheduledTransactionResponse>>
      getScheduledTransactionById(
          {@Path('budget_id')
          @required
              String budget_id,
          @Path('scheduled_transaction_id')
          @required
              String scheduled_transaction_id});
}

final Map<Type, Object Function(Map<String, dynamic>)> YnabJsonDecoderMappings =
    {
  ErrorResponse: ErrorResponse.fromJsonFactory,
  ErrorDetail: ErrorDetail.fromJsonFactory,
  UserResponse: UserResponse.fromJsonFactory,
  User: User.fromJsonFactory,
  DateFormat: DateFormat.fromJsonFactory,
  CurrencyFormat: CurrencyFormat.fromJsonFactory,
  BudgetSummaryResponse: BudgetSummaryResponse.fromJsonFactory,
  BudgetSummary: BudgetSummary.fromJsonFactory,
  BudgetDetailResponse: BudgetDetailResponse.fromJsonFactory,
  BudgetDetail: BudgetDetail.fromJsonFactory,
  BudgetSettingsResponse: BudgetSettingsResponse.fromJsonFactory,
  BudgetSettings: BudgetSettings.fromJsonFactory,
  AccountsResponse: AccountsResponse.fromJsonFactory,
  AccountResponse: AccountResponse.fromJsonFactory,
  Account: Account.fromJsonFactory,
  SaveAccountWrapper: SaveAccountWrapper.fromJsonFactory,
  SaveAccount: SaveAccount.fromJsonFactory,
  CategoriesResponse: CategoriesResponse.fromJsonFactory,
  CategoryResponse: CategoryResponse.fromJsonFactory,
  CategoryGroupWithCategories: CategoryGroupWithCategories.fromJsonFactory,
  CategoryGroup: CategoryGroup.fromJsonFactory,
  Category: Category.fromJsonFactory,
  SaveCategoryResponse: SaveCategoryResponse.fromJsonFactory,
  PayeesResponse: PayeesResponse.fromJsonFactory,
  PayeeResponse: PayeeResponse.fromJsonFactory,
  Payee: Payee.fromJsonFactory,
  PayeeLocationsResponse: PayeeLocationsResponse.fromJsonFactory,
  PayeeLocationResponse: PayeeLocationResponse.fromJsonFactory,
  PayeeLocation: PayeeLocation.fromJsonFactory,
  TransactionsResponse: TransactionsResponse.fromJsonFactory,
  HybridTransactionsResponse: HybridTransactionsResponse.fromJsonFactory,
  SaveTransactionWrapper: SaveTransactionWrapper.fromJsonFactory,
  SaveTransactionsWrapper: SaveTransactionsWrapper.fromJsonFactory,
  UpdateTransactionsWrapper: UpdateTransactionsWrapper.fromJsonFactory,
  UpdateTransaction: UpdateTransaction.fromJsonFactory,
  SaveTransaction: SaveTransaction.fromJsonFactory,
  SaveSubTransaction: SaveSubTransaction.fromJsonFactory,
  SaveTransactionsResponse: SaveTransactionsResponse.fromJsonFactory,
  TransactionResponse: TransactionResponse.fromJsonFactory,
  TransactionSummary: TransactionSummary.fromJsonFactory,
  TransactionDetail: TransactionDetail.fromJsonFactory,
  HybridTransaction: HybridTransaction.fromJsonFactory,
  SaveMonthCategoryWrapper: SaveMonthCategoryWrapper.fromJsonFactory,
  SaveMonthCategory: SaveMonthCategory.fromJsonFactory,
  TransactionsImportResponse: TransactionsImportResponse.fromJsonFactory,
  BulkResponse: BulkResponse.fromJsonFactory,
  BulkTransactions: BulkTransactions.fromJsonFactory,
  SubTransaction: SubTransaction.fromJsonFactory,
  ScheduledTransactionsResponse: ScheduledTransactionsResponse.fromJsonFactory,
  ScheduledTransactionResponse: ScheduledTransactionResponse.fromJsonFactory,
  ScheduledTransactionSummary: ScheduledTransactionSummary.fromJsonFactory,
  ScheduledTransactionDetail: ScheduledTransactionDetail.fromJsonFactory,
  ScheduledSubTransaction: ScheduledSubTransaction.fromJsonFactory,
  MonthSummariesResponse: MonthSummariesResponse.fromJsonFactory,
  MonthDetailResponse: MonthDetailResponse.fromJsonFactory,
  MonthSummary: MonthSummary.fromJsonFactory,
  MonthDetail: MonthDetail.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class ErrorResponse {
  ErrorResponse({
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @JsonKey(name: 'error', includeIfNull: false)
  final ErrorDetail error;
  static const fromJsonFactory = _$ErrorResponseFromJson;
  static const toJsonFactory = _$ErrorResponseToJson;
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

extension $ErrorResponseExtension on ErrorResponse {
  ErrorResponse copyWith({ErrorDetail error}) {
    return ErrorResponse(error: error ?? this.error);
  }
}

@JsonSerializable(explicitToJson: true)
class ErrorDetail {
  ErrorDetail({
    this.id,
    this.name,
    this.detail,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'detail', includeIfNull: false)
  final String detail;
  static const fromJsonFactory = _$ErrorDetailFromJson;
  static const toJsonFactory = _$ErrorDetailToJson;
  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}

extension $ErrorDetailExtension on ErrorDetail {
  ErrorDetail copyWith({String id, String name, String detail}) {
    return ErrorDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        detail: detail ?? this.detail);
  }
}

@JsonSerializable(explicitToJson: true)
class UserResponse {
  UserResponse({
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$UserResponseFromJson;
  static const toJsonFactory = _$UserResponseToJson;
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

extension $UserResponseExtension on UserResponse {
  UserResponse copyWith({Object data}) {
    return UserResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension $UserExtension on User {
  User copyWith({String id}) {
    return User(id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class DateFormat {
  DateFormat({
    this.format,
  });

  factory DateFormat.fromJson(Map<String, dynamic> json) =>
      _$DateFormatFromJson(json);

  @JsonKey(name: 'format', includeIfNull: false)
  final String format;
  static const fromJsonFactory = _$DateFormatFromJson;
  static const toJsonFactory = _$DateFormatToJson;
  Map<String, dynamic> toJson() => _$DateFormatToJson(this);
}

extension $DateFormatExtension on DateFormat {
  DateFormat copyWith({String format}) {
    return DateFormat(format: format ?? this.format);
  }
}

@JsonSerializable(explicitToJson: true)
class CurrencyFormat {
  CurrencyFormat({
    this.isoCode,
    this.exampleFormat,
    this.decimalDigits,
    this.decimalSeparator,
    this.symbolFirst,
    this.groupSeparator,
    this.currencySymbol,
    this.displaySymbol,
  });

  factory CurrencyFormat.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFormatFromJson(json);

  @JsonKey(name: 'iso_code', includeIfNull: false)
  final String isoCode;
  @JsonKey(name: 'example_format', includeIfNull: false)
  final String exampleFormat;
  @JsonKey(name: 'decimal_digits', includeIfNull: false, defaultValue: 36)
  final int decimalDigits;
  @JsonKey(name: 'decimal_separator', includeIfNull: false)
  final String decimalSeparator;
  @JsonKey(name: 'symbol_first', includeIfNull: false)
  final bool symbolFirst;
  @JsonKey(name: 'group_separator', includeIfNull: false)
  final String groupSeparator;
  @JsonKey(name: 'currency_symbol', includeIfNull: false)
  final String currencySymbol;
  @JsonKey(name: 'display_symbol', includeIfNull: false)
  final bool displaySymbol;
  static const fromJsonFactory = _$CurrencyFormatFromJson;
  static const toJsonFactory = _$CurrencyFormatToJson;
  Map<String, dynamic> toJson() => _$CurrencyFormatToJson(this);
}

extension $CurrencyFormatExtension on CurrencyFormat {
  CurrencyFormat copyWith(
      {String isoCode,
      String exampleFormat,
      int decimalDigits,
      String decimalSeparator,
      bool symbolFirst,
      String groupSeparator,
      String currencySymbol,
      bool displaySymbol}) {
    return CurrencyFormat(
        isoCode: isoCode ?? this.isoCode,
        exampleFormat: exampleFormat ?? this.exampleFormat,
        decimalDigits: decimalDigits ?? this.decimalDigits,
        decimalSeparator: decimalSeparator ?? this.decimalSeparator,
        symbolFirst: symbolFirst ?? this.symbolFirst,
        groupSeparator: groupSeparator ?? this.groupSeparator,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        displaySymbol: displaySymbol ?? this.displaySymbol);
  }
}

@JsonSerializable(explicitToJson: true)
class BudgetSummaryResponse {
  BudgetSummaryResponse({
    this.data,
  });

  factory BudgetSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$BudgetSummaryResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$BudgetSummaryResponseFromJson;
  static const toJsonFactory = _$BudgetSummaryResponseToJson;
  Map<String, dynamic> toJson() => _$BudgetSummaryResponseToJson(this);
}

extension $BudgetSummaryResponseExtension on BudgetSummaryResponse {
  BudgetSummaryResponse copyWith({Object data}) {
    return BudgetSummaryResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BudgetSummary {
  BudgetSummary({
    this.id,
    this.name,
    this.lastModifiedOn,
    this.firstMonth,
    this.lastMonth,
    this.dateFormat,
    this.currencyFormat,
    this.accounts,
  });

  factory BudgetSummary.fromJson(Map<String, dynamic> json) =>
      _$BudgetSummaryFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'last_modified_on', includeIfNull: false)
  final DateTime lastModifiedOn;
  @JsonKey(name: 'first_month', includeIfNull: false)
  final DateTime firstMonth;
  @JsonKey(name: 'last_month', includeIfNull: false)
  final DateTime lastMonth;
  @JsonKey(name: 'date_format', includeIfNull: false)
  final DateFormat dateFormat;
  @JsonKey(name: 'currency_format', includeIfNull: false)
  final CurrencyFormat currencyFormat;
  @JsonKey(name: 'accounts', includeIfNull: false, defaultValue: <Account>[])
  final List<Account> accounts;
  static const fromJsonFactory = _$BudgetSummaryFromJson;
  static const toJsonFactory = _$BudgetSummaryToJson;
  Map<String, dynamic> toJson() => _$BudgetSummaryToJson(this);
}

extension $BudgetSummaryExtension on BudgetSummary {
  BudgetSummary copyWith(
      {String id,
      String name,
      DateTime lastModifiedOn,
      DateTime firstMonth,
      DateTime lastMonth,
      DateFormat dateFormat,
      CurrencyFormat currencyFormat,
      List<Account> accounts}) {
    return BudgetSummary(
        id: id ?? this.id,
        name: name ?? this.name,
        lastModifiedOn: lastModifiedOn ?? this.lastModifiedOn,
        firstMonth: firstMonth ?? this.firstMonth,
        lastMonth: lastMonth ?? this.lastMonth,
        dateFormat: dateFormat ?? this.dateFormat,
        currencyFormat: currencyFormat ?? this.currencyFormat,
        accounts: accounts ?? this.accounts);
  }
}

@JsonSerializable(explicitToJson: true)
class BudgetDetailResponse {
  BudgetDetailResponse({
    this.data,
  });

  factory BudgetDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BudgetDetailResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$BudgetDetailResponseFromJson;
  static const toJsonFactory = _$BudgetDetailResponseToJson;
  Map<String, dynamic> toJson() => _$BudgetDetailResponseToJson(this);
}

extension $BudgetDetailResponseExtension on BudgetDetailResponse {
  BudgetDetailResponse copyWith({Object data}) {
    return BudgetDetailResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BudgetDetail {
  BudgetDetail();

  factory BudgetDetail.fromJson(Map<String, dynamic> json) =>
      _$BudgetDetailFromJson(json);

  static const fromJsonFactory = _$BudgetDetailFromJson;
  static const toJsonFactory = _$BudgetDetailToJson;
  Map<String, dynamic> toJson() => _$BudgetDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BudgetSettingsResponse {
  BudgetSettingsResponse({
    this.data,
  });

  factory BudgetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BudgetSettingsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$BudgetSettingsResponseFromJson;
  static const toJsonFactory = _$BudgetSettingsResponseToJson;
  Map<String, dynamic> toJson() => _$BudgetSettingsResponseToJson(this);
}

extension $BudgetSettingsResponseExtension on BudgetSettingsResponse {
  BudgetSettingsResponse copyWith({Object data}) {
    return BudgetSettingsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BudgetSettings {
  BudgetSettings({
    this.dateFormat,
    this.currencyFormat,
  });

  factory BudgetSettings.fromJson(Map<String, dynamic> json) =>
      _$BudgetSettingsFromJson(json);

  @JsonKey(name: 'date_format', includeIfNull: false)
  final DateFormat dateFormat;
  @JsonKey(name: 'currency_format', includeIfNull: false)
  final CurrencyFormat currencyFormat;
  static const fromJsonFactory = _$BudgetSettingsFromJson;
  static const toJsonFactory = _$BudgetSettingsToJson;
  Map<String, dynamic> toJson() => _$BudgetSettingsToJson(this);
}

extension $BudgetSettingsExtension on BudgetSettings {
  BudgetSettings copyWith(
      {DateFormat dateFormat, CurrencyFormat currencyFormat}) {
    return BudgetSettings(
        dateFormat: dateFormat ?? this.dateFormat,
        currencyFormat: currencyFormat ?? this.currencyFormat);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountsResponse {
  AccountsResponse({
    this.data,
  });

  factory AccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$AccountsResponseFromJson;
  static const toJsonFactory = _$AccountsResponseToJson;
  Map<String, dynamic> toJson() => _$AccountsResponseToJson(this);
}

extension $AccountsResponseExtension on AccountsResponse {
  AccountsResponse copyWith({Object data}) {
    return AccountsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class AccountResponse {
  AccountResponse({
    this.data,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$AccountResponseFromJson;
  static const toJsonFactory = _$AccountResponseToJson;
  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}

extension $AccountResponseExtension on AccountResponse {
  AccountResponse copyWith({Object data}) {
    return AccountResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class Account {
  Account({
    this.id,
    this.name,
    this.type,
    this.onBudget,
    this.closed,
    this.note,
    this.balance,
    this.clearedBalance,
    this.unclearedBalance,
    this.transferPayeeId,
    this.deleted,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
      name: 'type',
      includeIfNull: false,
      toJson: accountTypeToJson,
      fromJson: accountTypeFromJson)
  final enums.AccountType type;
  @JsonKey(name: 'on_budget', includeIfNull: false)
  final bool onBudget;
  @JsonKey(name: 'closed', includeIfNull: false)
  final bool closed;
  @JsonKey(name: 'note', includeIfNull: false)
  final String note;
  @JsonKey(name: 'balance', includeIfNull: false, defaultValue: 36)
  final int balance;
  @JsonKey(name: 'cleared_balance', includeIfNull: false, defaultValue: 36)
  final int clearedBalance;
  @JsonKey(name: 'uncleared_balance', includeIfNull: false, defaultValue: 36)
  final int unclearedBalance;
  @JsonKey(name: 'transfer_payee_id', includeIfNull: false)
  final String transferPayeeId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$AccountFromJson;
  static const toJsonFactory = _$AccountToJson;
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

extension $AccountExtension on Account {
  Account copyWith(
      {String id,
      String name,
      enums.AccountType type,
      bool onBudget,
      bool closed,
      String note,
      int balance,
      int clearedBalance,
      int unclearedBalance,
      String transferPayeeId,
      bool deleted}) {
    return Account(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        onBudget: onBudget ?? this.onBudget,
        closed: closed ?? this.closed,
        note: note ?? this.note,
        balance: balance ?? this.balance,
        clearedBalance: clearedBalance ?? this.clearedBalance,
        unclearedBalance: unclearedBalance ?? this.unclearedBalance,
        transferPayeeId: transferPayeeId ?? this.transferPayeeId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveAccountWrapper {
  SaveAccountWrapper({
    this.account,
  });

  factory SaveAccountWrapper.fromJson(Map<String, dynamic> json) =>
      _$SaveAccountWrapperFromJson(json);

  @JsonKey(name: 'account', includeIfNull: false)
  final SaveAccount account;
  static const fromJsonFactory = _$SaveAccountWrapperFromJson;
  static const toJsonFactory = _$SaveAccountWrapperToJson;
  Map<String, dynamic> toJson() => _$SaveAccountWrapperToJson(this);
}

extension $SaveAccountWrapperExtension on SaveAccountWrapper {
  SaveAccountWrapper copyWith({SaveAccount account}) {
    return SaveAccountWrapper(account: account ?? this.account);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveAccount {
  SaveAccount({
    this.name,
    this.type,
    this.balance,
  });

  factory SaveAccount.fromJson(Map<String, dynamic> json) =>
      _$SaveAccountFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(
      name: 'type',
      includeIfNull: false,
      toJson: saveAccountTypeToJson,
      fromJson: saveAccountTypeFromJson)
  final enums.SaveAccountType type;
  @JsonKey(name: 'balance', includeIfNull: false, defaultValue: 36)
  final int balance;
  static const fromJsonFactory = _$SaveAccountFromJson;
  static const toJsonFactory = _$SaveAccountToJson;
  Map<String, dynamic> toJson() => _$SaveAccountToJson(this);
}

extension $SaveAccountExtension on SaveAccount {
  SaveAccount copyWith({String name, enums.SaveAccountType type, int balance}) {
    return SaveAccount(
        name: name ?? this.name,
        type: type ?? this.type,
        balance: balance ?? this.balance);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoriesResponse {
  CategoriesResponse({
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$CategoriesResponseFromJson;
  static const toJsonFactory = _$CategoriesResponseToJson;
  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

extension $CategoriesResponseExtension on CategoriesResponse {
  CategoriesResponse copyWith({Object data}) {
    return CategoriesResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryResponse {
  CategoryResponse({
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$CategoryResponseFromJson;
  static const toJsonFactory = _$CategoryResponseToJson;
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

extension $CategoryResponseExtension on CategoryResponse {
  CategoryResponse copyWith({Object data}) {
    return CategoryResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryGroupWithCategories {
  CategoryGroupWithCategories();

  factory CategoryGroupWithCategories.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupWithCategoriesFromJson(json);

  static const fromJsonFactory = _$CategoryGroupWithCategoriesFromJson;
  static const toJsonFactory = _$CategoryGroupWithCategoriesToJson;
  Map<String, dynamic> toJson() => _$CategoryGroupWithCategoriesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CategoryGroup {
  CategoryGroup({
    this.id,
    this.name,
    this.hidden,
    this.deleted,
  });

  factory CategoryGroup.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'hidden', includeIfNull: false)
  final bool hidden;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$CategoryGroupFromJson;
  static const toJsonFactory = _$CategoryGroupToJson;
  Map<String, dynamic> toJson() => _$CategoryGroupToJson(this);
}

extension $CategoryGroupExtension on CategoryGroup {
  CategoryGroup copyWith({String id, String name, bool hidden, bool deleted}) {
    return CategoryGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        hidden: hidden ?? this.hidden,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    this.id,
    this.categoryGroupId,
    this.name,
    this.hidden,
    this.originalCategoryGroupId,
    this.note,
    this.budgeted,
    this.activity,
    this.balance,
    this.goalType,
    this.goalCreationMonth,
    this.goalTarget,
    this.goalTargetMonth,
    this.goalPercentageComplete,
    this.deleted,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'category_group_id', includeIfNull: false)
  final String categoryGroupId;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'hidden', includeIfNull: false)
  final bool hidden;
  @JsonKey(name: 'original_category_group_id', includeIfNull: false)
  final String originalCategoryGroupId;
  @JsonKey(name: 'note', includeIfNull: false)
  final String note;
  @JsonKey(name: 'budgeted', includeIfNull: false, defaultValue: 36)
  final int budgeted;
  @JsonKey(name: 'activity', includeIfNull: false, defaultValue: 36)
  final int activity;
  @JsonKey(name: 'balance', includeIfNull: false, defaultValue: 36)
  final int balance;
  @JsonKey(name: 'goal_type', includeIfNull: false)
  final enums.CategoryGoalType goalType;
  @JsonKey(name: 'goal_creation_month', includeIfNull: false)
  final DateTime goalCreationMonth;
  @JsonKey(name: 'goal_target', includeIfNull: false, defaultValue: 36)
  final int goalTarget;
  @JsonKey(name: 'goal_target_month', includeIfNull: false)
  final DateTime goalTargetMonth;
  @JsonKey(
      name: 'goal_percentage_complete', includeIfNull: false, defaultValue: 36)
  final int goalPercentageComplete;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$CategoryFromJson;
  static const toJsonFactory = _$CategoryToJson;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

extension $CategoryExtension on Category {
  Category copyWith(
      {String id,
      String categoryGroupId,
      String name,
      bool hidden,
      String originalCategoryGroupId,
      String note,
      int budgeted,
      int activity,
      int balance,
      enums.CategoryGoalType goalType,
      DateTime goalCreationMonth,
      int goalTarget,
      DateTime goalTargetMonth,
      int goalPercentageComplete,
      bool deleted}) {
    return Category(
        id: id ?? this.id,
        categoryGroupId: categoryGroupId ?? this.categoryGroupId,
        name: name ?? this.name,
        hidden: hidden ?? this.hidden,
        originalCategoryGroupId:
            originalCategoryGroupId ?? this.originalCategoryGroupId,
        note: note ?? this.note,
        budgeted: budgeted ?? this.budgeted,
        activity: activity ?? this.activity,
        balance: balance ?? this.balance,
        goalType: goalType ?? this.goalType,
        goalCreationMonth: goalCreationMonth ?? this.goalCreationMonth,
        goalTarget: goalTarget ?? this.goalTarget,
        goalTargetMonth: goalTargetMonth ?? this.goalTargetMonth,
        goalPercentageComplete:
            goalPercentageComplete ?? this.goalPercentageComplete,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveCategoryResponse {
  SaveCategoryResponse({
    this.data,
  });

  factory SaveCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveCategoryResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$SaveCategoryResponseFromJson;
  static const toJsonFactory = _$SaveCategoryResponseToJson;
  Map<String, dynamic> toJson() => _$SaveCategoryResponseToJson(this);
}

extension $SaveCategoryResponseExtension on SaveCategoryResponse {
  SaveCategoryResponse copyWith({Object data}) {
    return SaveCategoryResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PayeesResponse {
  PayeesResponse({
    this.data,
  });

  factory PayeesResponse.fromJson(Map<String, dynamic> json) =>
      _$PayeesResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$PayeesResponseFromJson;
  static const toJsonFactory = _$PayeesResponseToJson;
  Map<String, dynamic> toJson() => _$PayeesResponseToJson(this);
}

extension $PayeesResponseExtension on PayeesResponse {
  PayeesResponse copyWith({Object data}) {
    return PayeesResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PayeeResponse {
  PayeeResponse({
    this.data,
  });

  factory PayeeResponse.fromJson(Map<String, dynamic> json) =>
      _$PayeeResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$PayeeResponseFromJson;
  static const toJsonFactory = _$PayeeResponseToJson;
  Map<String, dynamic> toJson() => _$PayeeResponseToJson(this);
}

extension $PayeeResponseExtension on PayeeResponse {
  PayeeResponse copyWith({Object data}) {
    return PayeeResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class Payee {
  Payee({
    this.id,
    this.name,
    this.transferAccountId,
    this.deleted,
  });

  factory Payee.fromJson(Map<String, dynamic> json) => _$PayeeFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'transfer_account_id', includeIfNull: false)
  final String transferAccountId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$PayeeFromJson;
  static const toJsonFactory = _$PayeeToJson;
  Map<String, dynamic> toJson() => _$PayeeToJson(this);
}

extension $PayeeExtension on Payee {
  Payee copyWith(
      {String id, String name, String transferAccountId, bool deleted}) {
    return Payee(
        id: id ?? this.id,
        name: name ?? this.name,
        transferAccountId: transferAccountId ?? this.transferAccountId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class PayeeLocationsResponse {
  PayeeLocationsResponse({
    this.data,
  });

  factory PayeeLocationsResponse.fromJson(Map<String, dynamic> json) =>
      _$PayeeLocationsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$PayeeLocationsResponseFromJson;
  static const toJsonFactory = _$PayeeLocationsResponseToJson;
  Map<String, dynamic> toJson() => _$PayeeLocationsResponseToJson(this);
}

extension $PayeeLocationsResponseExtension on PayeeLocationsResponse {
  PayeeLocationsResponse copyWith({Object data}) {
    return PayeeLocationsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PayeeLocationResponse {
  PayeeLocationResponse({
    this.data,
  });

  factory PayeeLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$PayeeLocationResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$PayeeLocationResponseFromJson;
  static const toJsonFactory = _$PayeeLocationResponseToJson;
  Map<String, dynamic> toJson() => _$PayeeLocationResponseToJson(this);
}

extension $PayeeLocationResponseExtension on PayeeLocationResponse {
  PayeeLocationResponse copyWith({Object data}) {
    return PayeeLocationResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class PayeeLocation {
  PayeeLocation({
    this.id,
    this.payeeId,
    this.latitude,
    this.longitude,
    this.deleted,
  });

  factory PayeeLocation.fromJson(Map<String, dynamic> json) =>
      _$PayeeLocationFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'latitude', includeIfNull: false)
  final String latitude;
  @JsonKey(name: 'longitude', includeIfNull: false)
  final String longitude;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$PayeeLocationFromJson;
  static const toJsonFactory = _$PayeeLocationToJson;
  Map<String, dynamic> toJson() => _$PayeeLocationToJson(this);
}

extension $PayeeLocationExtension on PayeeLocation {
  PayeeLocation copyWith(
      {String id,
      String payeeId,
      String latitude,
      String longitude,
      bool deleted}) {
    return PayeeLocation(
        id: id ?? this.id,
        payeeId: payeeId ?? this.payeeId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionsResponse {
  TransactionsResponse({
    this.data,
  });

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$TransactionsResponseFromJson;
  static const toJsonFactory = _$TransactionsResponseToJson;
  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);
}

extension $TransactionsResponseExtension on TransactionsResponse {
  TransactionsResponse copyWith({Object data}) {
    return TransactionsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class HybridTransactionsResponse {
  HybridTransactionsResponse({
    this.data,
  });

  factory HybridTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$HybridTransactionsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$HybridTransactionsResponseFromJson;
  static const toJsonFactory = _$HybridTransactionsResponseToJson;
  Map<String, dynamic> toJson() => _$HybridTransactionsResponseToJson(this);
}

extension $HybridTransactionsResponseExtension on HybridTransactionsResponse {
  HybridTransactionsResponse copyWith({Object data}) {
    return HybridTransactionsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveTransactionWrapper {
  SaveTransactionWrapper({
    this.transaction,
  });

  factory SaveTransactionWrapper.fromJson(Map<String, dynamic> json) =>
      _$SaveTransactionWrapperFromJson(json);

  @JsonKey(name: 'transaction', includeIfNull: false)
  final SaveTransaction transaction;
  static const fromJsonFactory = _$SaveTransactionWrapperFromJson;
  static const toJsonFactory = _$SaveTransactionWrapperToJson;
  Map<String, dynamic> toJson() => _$SaveTransactionWrapperToJson(this);
}

extension $SaveTransactionWrapperExtension on SaveTransactionWrapper {
  SaveTransactionWrapper copyWith({SaveTransaction transaction}) {
    return SaveTransactionWrapper(transaction: transaction ?? this.transaction);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveTransactionsWrapper {
  SaveTransactionsWrapper({
    this.transaction,
    this.transactions,
  });

  factory SaveTransactionsWrapper.fromJson(Map<String, dynamic> json) =>
      _$SaveTransactionsWrapperFromJson(json);

  @JsonKey(name: 'transaction', includeIfNull: false)
  final SaveTransaction transaction;
  @JsonKey(
      name: 'transactions',
      includeIfNull: false,
      defaultValue: <SaveTransaction>[])
  final List<SaveTransaction> transactions;
  static const fromJsonFactory = _$SaveTransactionsWrapperFromJson;
  static const toJsonFactory = _$SaveTransactionsWrapperToJson;
  Map<String, dynamic> toJson() => _$SaveTransactionsWrapperToJson(this);
}

extension $SaveTransactionsWrapperExtension on SaveTransactionsWrapper {
  SaveTransactionsWrapper copyWith(
      {SaveTransaction transaction, List<SaveTransaction> transactions}) {
    return SaveTransactionsWrapper(
        transaction: transaction ?? this.transaction,
        transactions: transactions ?? this.transactions);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateTransactionsWrapper {
  UpdateTransactionsWrapper({
    this.transactions,
  });

  factory UpdateTransactionsWrapper.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionsWrapperFromJson(json);

  @JsonKey(
      name: 'transactions',
      includeIfNull: false,
      defaultValue: <UpdateTransaction>[])
  final List<UpdateTransaction> transactions;
  static const fromJsonFactory = _$UpdateTransactionsWrapperFromJson;
  static const toJsonFactory = _$UpdateTransactionsWrapperToJson;
  Map<String, dynamic> toJson() => _$UpdateTransactionsWrapperToJson(this);
}

extension $UpdateTransactionsWrapperExtension on UpdateTransactionsWrapper {
  UpdateTransactionsWrapper copyWith({List<UpdateTransaction> transactions}) {
    return UpdateTransactionsWrapper(
        transactions: transactions ?? this.transactions);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateTransaction {
  UpdateTransaction();

  factory UpdateTransaction.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionFromJson(json);

  static const fromJsonFactory = _$UpdateTransactionFromJson;
  static const toJsonFactory = _$UpdateTransactionToJson;
  Map<String, dynamic> toJson() => _$UpdateTransactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SaveTransaction {
  SaveTransaction({
    this.accountId,
    this.date,
    this.amount,
    this.payeeId,
    this.payeeName,
    this.categoryId,
    this.memo,
    this.cleared,
    this.approved,
    this.flagColor,
    this.importId,
    this.subtransactions,
  });

  factory SaveTransaction.fromJson(Map<String, dynamic> json) =>
      _$SaveTransactionFromJson(json);

  @JsonKey(name: 'account_id', includeIfNull: false)
  final String accountId;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'payee_name', includeIfNull: false)
  final String payeeName;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  @JsonKey(
      name: 'cleared',
      includeIfNull: false,
      toJson: saveTransactionClearedToJson,
      fromJson: saveTransactionClearedFromJson)
  final enums.SaveTransactionCleared cleared;
  @JsonKey(name: 'approved', includeIfNull: false)
  final bool approved;
  @JsonKey(name: 'flag_color', includeIfNull: false)
  final enums.SaveTransactionFlagColor flagColor;
  @JsonKey(name: 'import_id', includeIfNull: false)
  final String importId;
  @JsonKey(
      name: 'subtransactions',
      includeIfNull: false,
      defaultValue: <SaveSubTransaction>[])
  final List<SaveSubTransaction> subtransactions;
  static const fromJsonFactory = _$SaveTransactionFromJson;
  static const toJsonFactory = _$SaveTransactionToJson;
  Map<String, dynamic> toJson() => _$SaveTransactionToJson(this);
}

extension $SaveTransactionExtension on SaveTransaction {
  SaveTransaction copyWith(
      {String accountId,
      DateTime date,
      int amount,
      String payeeId,
      String payeeName,
      String categoryId,
      String memo,
      enums.SaveTransactionCleared cleared,
      bool approved,
      enums.SaveTransactionFlagColor flagColor,
      String importId,
      List<SaveSubTransaction> subtransactions}) {
    return SaveTransaction(
        accountId: accountId ?? this.accountId,
        date: date ?? this.date,
        amount: amount ?? this.amount,
        payeeId: payeeId ?? this.payeeId,
        payeeName: payeeName ?? this.payeeName,
        categoryId: categoryId ?? this.categoryId,
        memo: memo ?? this.memo,
        cleared: cleared ?? this.cleared,
        approved: approved ?? this.approved,
        flagColor: flagColor ?? this.flagColor,
        importId: importId ?? this.importId,
        subtransactions: subtransactions ?? this.subtransactions);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveSubTransaction {
  SaveSubTransaction({
    this.amount,
    this.payeeId,
    this.payeeName,
    this.categoryId,
    this.memo,
  });

  factory SaveSubTransaction.fromJson(Map<String, dynamic> json) =>
      _$SaveSubTransactionFromJson(json);

  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'payee_name', includeIfNull: false)
  final String payeeName;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  static const fromJsonFactory = _$SaveSubTransactionFromJson;
  static const toJsonFactory = _$SaveSubTransactionToJson;
  Map<String, dynamic> toJson() => _$SaveSubTransactionToJson(this);
}

extension $SaveSubTransactionExtension on SaveSubTransaction {
  SaveSubTransaction copyWith(
      {int amount,
      String payeeId,
      String payeeName,
      String categoryId,
      String memo}) {
    return SaveSubTransaction(
        amount: amount ?? this.amount,
        payeeId: payeeId ?? this.payeeId,
        payeeName: payeeName ?? this.payeeName,
        categoryId: categoryId ?? this.categoryId,
        memo: memo ?? this.memo);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveTransactionsResponse {
  SaveTransactionsResponse({
    this.data,
  });

  factory SaveTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveTransactionsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$SaveTransactionsResponseFromJson;
  static const toJsonFactory = _$SaveTransactionsResponseToJson;
  Map<String, dynamic> toJson() => _$SaveTransactionsResponseToJson(this);
}

extension $SaveTransactionsResponseExtension on SaveTransactionsResponse {
  SaveTransactionsResponse copyWith({Object data}) {
    return SaveTransactionsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionResponse {
  TransactionResponse({
    this.data,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$TransactionResponseFromJson;
  static const toJsonFactory = _$TransactionResponseToJson;
  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}

extension $TransactionResponseExtension on TransactionResponse {
  TransactionResponse copyWith({Object data}) {
    return TransactionResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionSummary {
  TransactionSummary({
    this.id,
    this.date,
    this.amount,
    this.memo,
    this.cleared,
    this.approved,
    this.flagColor,
    this.accountId,
    this.payeeId,
    this.categoryId,
    this.transferAccountId,
    this.transferTransactionId,
    this.matchedTransactionId,
    this.importId,
    this.deleted,
  });

  factory TransactionSummary.fromJson(Map<String, dynamic> json) =>
      _$TransactionSummaryFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'date', includeIfNull: false)
  final DateTime date;
  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  @JsonKey(
      name: 'cleared',
      includeIfNull: false,
      toJson: transactionSummaryClearedToJson,
      fromJson: transactionSummaryClearedFromJson)
  final enums.TransactionSummaryCleared cleared;
  @JsonKey(name: 'approved', includeIfNull: false)
  final bool approved;
  @JsonKey(name: 'flag_color', includeIfNull: false)
  final enums.TransactionSummaryFlagColor flagColor;
  @JsonKey(name: 'account_id', includeIfNull: false)
  final String accountId;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'transfer_account_id', includeIfNull: false)
  final String transferAccountId;
  @JsonKey(name: 'transfer_transaction_id', includeIfNull: false)
  final String transferTransactionId;
  @JsonKey(name: 'matched_transaction_id', includeIfNull: false)
  final String matchedTransactionId;
  @JsonKey(name: 'import_id', includeIfNull: false)
  final String importId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$TransactionSummaryFromJson;
  static const toJsonFactory = _$TransactionSummaryToJson;
  Map<String, dynamic> toJson() => _$TransactionSummaryToJson(this);
}

extension $TransactionSummaryExtension on TransactionSummary {
  TransactionSummary copyWith(
      {String id,
      DateTime date,
      int amount,
      String memo,
      enums.TransactionSummaryCleared cleared,
      bool approved,
      enums.TransactionSummaryFlagColor flagColor,
      String accountId,
      String payeeId,
      String categoryId,
      String transferAccountId,
      String transferTransactionId,
      String matchedTransactionId,
      String importId,
      bool deleted}) {
    return TransactionSummary(
        id: id ?? this.id,
        date: date ?? this.date,
        amount: amount ?? this.amount,
        memo: memo ?? this.memo,
        cleared: cleared ?? this.cleared,
        approved: approved ?? this.approved,
        flagColor: flagColor ?? this.flagColor,
        accountId: accountId ?? this.accountId,
        payeeId: payeeId ?? this.payeeId,
        categoryId: categoryId ?? this.categoryId,
        transferAccountId: transferAccountId ?? this.transferAccountId,
        transferTransactionId:
            transferTransactionId ?? this.transferTransactionId,
        matchedTransactionId: matchedTransactionId ?? this.matchedTransactionId,
        importId: importId ?? this.importId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionDetail {
  TransactionDetail();

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailFromJson(json);

  static const fromJsonFactory = _$TransactionDetailFromJson;
  static const toJsonFactory = _$TransactionDetailToJson;
  Map<String, dynamic> toJson() => _$TransactionDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HybridTransaction {
  HybridTransaction();

  factory HybridTransaction.fromJson(Map<String, dynamic> json) =>
      _$HybridTransactionFromJson(json);

  static const fromJsonFactory = _$HybridTransactionFromJson;
  static const toJsonFactory = _$HybridTransactionToJson;
  Map<String, dynamic> toJson() => _$HybridTransactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SaveMonthCategoryWrapper {
  SaveMonthCategoryWrapper({
    this.category,
  });

  factory SaveMonthCategoryWrapper.fromJson(Map<String, dynamic> json) =>
      _$SaveMonthCategoryWrapperFromJson(json);

  @JsonKey(name: 'category', includeIfNull: false)
  final SaveMonthCategory category;
  static const fromJsonFactory = _$SaveMonthCategoryWrapperFromJson;
  static const toJsonFactory = _$SaveMonthCategoryWrapperToJson;
  Map<String, dynamic> toJson() => _$SaveMonthCategoryWrapperToJson(this);
}

extension $SaveMonthCategoryWrapperExtension on SaveMonthCategoryWrapper {
  SaveMonthCategoryWrapper copyWith({SaveMonthCategory category}) {
    return SaveMonthCategoryWrapper(category: category ?? this.category);
  }
}

@JsonSerializable(explicitToJson: true)
class SaveMonthCategory {
  SaveMonthCategory({
    this.budgeted,
  });

  factory SaveMonthCategory.fromJson(Map<String, dynamic> json) =>
      _$SaveMonthCategoryFromJson(json);

  @JsonKey(name: 'budgeted', includeIfNull: false, defaultValue: 36)
  final int budgeted;
  static const fromJsonFactory = _$SaveMonthCategoryFromJson;
  static const toJsonFactory = _$SaveMonthCategoryToJson;
  Map<String, dynamic> toJson() => _$SaveMonthCategoryToJson(this);
}

extension $SaveMonthCategoryExtension on SaveMonthCategory {
  SaveMonthCategory copyWith({int budgeted}) {
    return SaveMonthCategory(budgeted: budgeted ?? this.budgeted);
  }
}

@JsonSerializable(explicitToJson: true)
class TransactionsImportResponse {
  TransactionsImportResponse({
    this.data,
  });

  factory TransactionsImportResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsImportResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$TransactionsImportResponseFromJson;
  static const toJsonFactory = _$TransactionsImportResponseToJson;
  Map<String, dynamic> toJson() => _$TransactionsImportResponseToJson(this);
}

extension $TransactionsImportResponseExtension on TransactionsImportResponse {
  TransactionsImportResponse copyWith({Object data}) {
    return TransactionsImportResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BulkResponse {
  BulkResponse({
    this.data,
  });

  factory BulkResponse.fromJson(Map<String, dynamic> json) =>
      _$BulkResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$BulkResponseFromJson;
  static const toJsonFactory = _$BulkResponseToJson;
  Map<String, dynamic> toJson() => _$BulkResponseToJson(this);
}

extension $BulkResponseExtension on BulkResponse {
  BulkResponse copyWith({Object data}) {
    return BulkResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class BulkTransactions {
  BulkTransactions({
    this.transactions,
  });

  factory BulkTransactions.fromJson(Map<String, dynamic> json) =>
      _$BulkTransactionsFromJson(json);

  @JsonKey(
      name: 'transactions',
      includeIfNull: false,
      defaultValue: <SaveTransaction>[])
  final List<SaveTransaction> transactions;
  static const fromJsonFactory = _$BulkTransactionsFromJson;
  static const toJsonFactory = _$BulkTransactionsToJson;
  Map<String, dynamic> toJson() => _$BulkTransactionsToJson(this);
}

extension $BulkTransactionsExtension on BulkTransactions {
  BulkTransactions copyWith({List<SaveTransaction> transactions}) {
    return BulkTransactions(transactions: transactions ?? this.transactions);
  }
}

@JsonSerializable(explicitToJson: true)
class SubTransaction {
  SubTransaction({
    this.id,
    this.transactionId,
    this.amount,
    this.memo,
    this.payeeId,
    this.payeeName,
    this.categoryId,
    this.categoryName,
    this.transferAccountId,
    this.transferTransactionId,
    this.deleted,
  });

  factory SubTransaction.fromJson(Map<String, dynamic> json) =>
      _$SubTransactionFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'transaction_id', includeIfNull: false)
  final String transactionId;
  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'payee_name', includeIfNull: false)
  final String payeeName;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'category_name', includeIfNull: false)
  final String categoryName;
  @JsonKey(name: 'transfer_account_id', includeIfNull: false)
  final String transferAccountId;
  @JsonKey(name: 'transfer_transaction_id', includeIfNull: false)
  final String transferTransactionId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$SubTransactionFromJson;
  static const toJsonFactory = _$SubTransactionToJson;
  Map<String, dynamic> toJson() => _$SubTransactionToJson(this);
}

extension $SubTransactionExtension on SubTransaction {
  SubTransaction copyWith(
      {String id,
      String transactionId,
      int amount,
      String memo,
      String payeeId,
      String payeeName,
      String categoryId,
      String categoryName,
      String transferAccountId,
      String transferTransactionId,
      bool deleted}) {
    return SubTransaction(
        id: id ?? this.id,
        transactionId: transactionId ?? this.transactionId,
        amount: amount ?? this.amount,
        memo: memo ?? this.memo,
        payeeId: payeeId ?? this.payeeId,
        payeeName: payeeName ?? this.payeeName,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        transferAccountId: transferAccountId ?? this.transferAccountId,
        transferTransactionId:
            transferTransactionId ?? this.transferTransactionId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledTransactionsResponse {
  ScheduledTransactionsResponse({
    this.data,
  });

  factory ScheduledTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTransactionsResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$ScheduledTransactionsResponseFromJson;
  static const toJsonFactory = _$ScheduledTransactionsResponseToJson;
  Map<String, dynamic> toJson() => _$ScheduledTransactionsResponseToJson(this);
}

extension $ScheduledTransactionsResponseExtension
    on ScheduledTransactionsResponse {
  ScheduledTransactionsResponse copyWith({Object data}) {
    return ScheduledTransactionsResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledTransactionResponse {
  ScheduledTransactionResponse({
    this.data,
  });

  factory ScheduledTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTransactionResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$ScheduledTransactionResponseFromJson;
  static const toJsonFactory = _$ScheduledTransactionResponseToJson;
  Map<String, dynamic> toJson() => _$ScheduledTransactionResponseToJson(this);
}

extension $ScheduledTransactionResponseExtension
    on ScheduledTransactionResponse {
  ScheduledTransactionResponse copyWith({Object data}) {
    return ScheduledTransactionResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledTransactionSummary {
  ScheduledTransactionSummary({
    this.id,
    this.dateFirst,
    this.dateNext,
    this.frequency,
    this.amount,
    this.memo,
    this.flagColor,
    this.accountId,
    this.payeeId,
    this.categoryId,
    this.transferAccountId,
    this.deleted,
  });

  factory ScheduledTransactionSummary.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTransactionSummaryFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'date_first', includeIfNull: false)
  final DateTime dateFirst;
  @JsonKey(name: 'date_next', includeIfNull: false)
  final DateTime dateNext;
  @JsonKey(
      name: 'frequency',
      includeIfNull: false,
      toJson: scheduledTransactionSummaryFrequencyToJson,
      fromJson: scheduledTransactionSummaryFrequencyFromJson)
  final enums.ScheduledTransactionSummaryFrequency frequency;
  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  @JsonKey(name: 'flag_color', includeIfNull: false)
  final enums.ScheduledTransactionSummaryFlagColor flagColor;
  @JsonKey(name: 'account_id', includeIfNull: false)
  final String accountId;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'transfer_account_id', includeIfNull: false)
  final String transferAccountId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$ScheduledTransactionSummaryFromJson;
  static const toJsonFactory = _$ScheduledTransactionSummaryToJson;
  Map<String, dynamic> toJson() => _$ScheduledTransactionSummaryToJson(this);
}

extension $ScheduledTransactionSummaryExtension on ScheduledTransactionSummary {
  ScheduledTransactionSummary copyWith(
      {String id,
      DateTime dateFirst,
      DateTime dateNext,
      enums.ScheduledTransactionSummaryFrequency frequency,
      int amount,
      String memo,
      enums.ScheduledTransactionSummaryFlagColor flagColor,
      String accountId,
      String payeeId,
      String categoryId,
      String transferAccountId,
      bool deleted}) {
    return ScheduledTransactionSummary(
        id: id ?? this.id,
        dateFirst: dateFirst ?? this.dateFirst,
        dateNext: dateNext ?? this.dateNext,
        frequency: frequency ?? this.frequency,
        amount: amount ?? this.amount,
        memo: memo ?? this.memo,
        flagColor: flagColor ?? this.flagColor,
        accountId: accountId ?? this.accountId,
        payeeId: payeeId ?? this.payeeId,
        categoryId: categoryId ?? this.categoryId,
        transferAccountId: transferAccountId ?? this.transferAccountId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class ScheduledTransactionDetail {
  ScheduledTransactionDetail();

  factory ScheduledTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTransactionDetailFromJson(json);

  static const fromJsonFactory = _$ScheduledTransactionDetailFromJson;
  static const toJsonFactory = _$ScheduledTransactionDetailToJson;
  Map<String, dynamic> toJson() => _$ScheduledTransactionDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ScheduledSubTransaction {
  ScheduledSubTransaction({
    this.id,
    this.scheduledTransactionId,
    this.amount,
    this.memo,
    this.payeeId,
    this.categoryId,
    this.transferAccountId,
    this.deleted,
  });

  factory ScheduledSubTransaction.fromJson(Map<String, dynamic> json) =>
      _$ScheduledSubTransactionFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'scheduled_transaction_id', includeIfNull: false)
  final String scheduledTransactionId;
  @JsonKey(name: 'amount', includeIfNull: false, defaultValue: 36)
  final int amount;
  @JsonKey(name: 'memo', includeIfNull: false)
  final String memo;
  @JsonKey(name: 'payee_id', includeIfNull: false)
  final String payeeId;
  @JsonKey(name: 'category_id', includeIfNull: false)
  final String categoryId;
  @JsonKey(name: 'transfer_account_id', includeIfNull: false)
  final String transferAccountId;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$ScheduledSubTransactionFromJson;
  static const toJsonFactory = _$ScheduledSubTransactionToJson;
  Map<String, dynamic> toJson() => _$ScheduledSubTransactionToJson(this);
}

extension $ScheduledSubTransactionExtension on ScheduledSubTransaction {
  ScheduledSubTransaction copyWith(
      {String id,
      String scheduledTransactionId,
      int amount,
      String memo,
      String payeeId,
      String categoryId,
      String transferAccountId,
      bool deleted}) {
    return ScheduledSubTransaction(
        id: id ?? this.id,
        scheduledTransactionId:
            scheduledTransactionId ?? this.scheduledTransactionId,
        amount: amount ?? this.amount,
        memo: memo ?? this.memo,
        payeeId: payeeId ?? this.payeeId,
        categoryId: categoryId ?? this.categoryId,
        transferAccountId: transferAccountId ?? this.transferAccountId,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class MonthSummariesResponse {
  MonthSummariesResponse({
    this.data,
  });

  factory MonthSummariesResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthSummariesResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$MonthSummariesResponseFromJson;
  static const toJsonFactory = _$MonthSummariesResponseToJson;
  Map<String, dynamic> toJson() => _$MonthSummariesResponseToJson(this);
}

extension $MonthSummariesResponseExtension on MonthSummariesResponse {
  MonthSummariesResponse copyWith({Object data}) {
    return MonthSummariesResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MonthDetailResponse {
  MonthDetailResponse({
    this.data,
  });

  factory MonthDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthDetailResponseFromJson(json);

  @JsonKey(name: 'data', includeIfNull: false)
  final Object data;
  static const fromJsonFactory = _$MonthDetailResponseFromJson;
  static const toJsonFactory = _$MonthDetailResponseToJson;
  Map<String, dynamic> toJson() => _$MonthDetailResponseToJson(this);
}

extension $MonthDetailResponseExtension on MonthDetailResponse {
  MonthDetailResponse copyWith({Object data}) {
    return MonthDetailResponse(data: data ?? this.data);
  }
}

@JsonSerializable(explicitToJson: true)
class MonthSummary {
  MonthSummary({
    this.month,
    this.note,
    this.income,
    this.budgeted,
    this.activity,
    this.toBeBudgeted,
    this.ageOfMoney,
    this.deleted,
  });

  factory MonthSummary.fromJson(Map<String, dynamic> json) =>
      _$MonthSummaryFromJson(json);

  @JsonKey(name: 'month', includeIfNull: false)
  final DateTime month;
  @JsonKey(name: 'note', includeIfNull: false)
  final String note;
  @JsonKey(name: 'income', includeIfNull: false, defaultValue: 36)
  final int income;
  @JsonKey(name: 'budgeted', includeIfNull: false, defaultValue: 36)
  final int budgeted;
  @JsonKey(name: 'activity', includeIfNull: false, defaultValue: 36)
  final int activity;
  @JsonKey(name: 'to_be_budgeted', includeIfNull: false, defaultValue: 36)
  final int toBeBudgeted;
  @JsonKey(name: 'age_of_money', includeIfNull: false, defaultValue: 36)
  final int ageOfMoney;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool deleted;
  static const fromJsonFactory = _$MonthSummaryFromJson;
  static const toJsonFactory = _$MonthSummaryToJson;
  Map<String, dynamic> toJson() => _$MonthSummaryToJson(this);
}

extension $MonthSummaryExtension on MonthSummary {
  MonthSummary copyWith(
      {DateTime month,
      String note,
      int income,
      int budgeted,
      int activity,
      int toBeBudgeted,
      int ageOfMoney,
      bool deleted}) {
    return MonthSummary(
        month: month ?? this.month,
        note: note ?? this.note,
        income: income ?? this.income,
        budgeted: budgeted ?? this.budgeted,
        activity: activity ?? this.activity,
        toBeBudgeted: toBeBudgeted ?? this.toBeBudgeted,
        ageOfMoney: ageOfMoney ?? this.ageOfMoney,
        deleted: deleted ?? this.deleted);
  }
}

@JsonSerializable(explicitToJson: true)
class MonthDetail {
  MonthDetail();

  factory MonthDetail.fromJson(Map<String, dynamic> json) =>
      _$MonthDetailFromJson(json);

  static const fromJsonFactory = _$MonthDetailFromJson;
  static const toJsonFactory = _$MonthDetailToJson;
  Map<String, dynamic> toJson() => _$MonthDetailToJson(this);
}

String accountTypeToJson(enums.AccountType accountType) {
  return enums.$AccountTypeMap[accountType];
}

enums.AccountType accountTypeFromJson(String accountType) {
  if (accountType == null) {
    return enums.AccountType.swaggerGeneratedUnknown;
  }

  return enums.$AccountTypeMap.entries
          .firstWhere((element) => element.value == accountType,
              orElse: () => null)
          ?.key ??
      enums.AccountType.swaggerGeneratedUnknown;
}

List<String> accountTypeListToJson(List<enums.AccountType> accountType) {
  if (accountType == null) {
    return null;
  }

  return accountType.map((e) => enums.$AccountTypeMap[e]).toList();
}

List<enums.AccountType> accountTypeListFromJson(List accountType) {
  if (accountType == null) {
    return [];
  }

  return accountType.map((e) => accountTypeFromJson(e.toString())).toList();
}

String saveAccountTypeToJson(enums.SaveAccountType saveAccountType) {
  return enums.$SaveAccountTypeMap[saveAccountType];
}

enums.SaveAccountType saveAccountTypeFromJson(String saveAccountType) {
  if (saveAccountType == null) {
    return enums.SaveAccountType.swaggerGeneratedUnknown;
  }

  return enums.$SaveAccountTypeMap.entries
          .firstWhere((element) => element.value == saveAccountType,
              orElse: () => null)
          ?.key ??
      enums.SaveAccountType.swaggerGeneratedUnknown;
}

List<String> saveAccountTypeListToJson(
    List<enums.SaveAccountType> saveAccountType) {
  if (saveAccountType == null) {
    return null;
  }

  return saveAccountType.map((e) => enums.$SaveAccountTypeMap[e]).toList();
}

List<enums.SaveAccountType> saveAccountTypeListFromJson(List saveAccountType) {
  if (saveAccountType == null) {
    return [];
  }

  return saveAccountType
      .map((e) => saveAccountTypeFromJson(e.toString()))
      .toList();
}

String categoryGoalTypeToJson(enums.CategoryGoalType categoryGoalType) {
  return enums.$CategoryGoalTypeMap[categoryGoalType];
}

enums.CategoryGoalType categoryGoalTypeFromJson(String categoryGoalType) {
  if (categoryGoalType == null) {
    return enums.CategoryGoalType.swaggerGeneratedUnknown;
  }

  return enums.$CategoryGoalTypeMap.entries
          .firstWhere((element) => element.value == categoryGoalType,
              orElse: () => null)
          ?.key ??
      enums.CategoryGoalType.swaggerGeneratedUnknown;
}

List<String> categoryGoalTypeListToJson(
    List<enums.CategoryGoalType> categoryGoalType) {
  if (categoryGoalType == null) {
    return null;
  }

  return categoryGoalType.map((e) => enums.$CategoryGoalTypeMap[e]).toList();
}

List<enums.CategoryGoalType> categoryGoalTypeListFromJson(
    List categoryGoalType) {
  if (categoryGoalType == null) {
    return [];
  }

  return categoryGoalType
      .map((e) => categoryGoalTypeFromJson(e.toString()))
      .toList();
}

String saveTransactionClearedToJson(
    enums.SaveTransactionCleared saveTransactionCleared) {
  return enums.$SaveTransactionClearedMap[saveTransactionCleared];
}

enums.SaveTransactionCleared saveTransactionClearedFromJson(
    String saveTransactionCleared) {
  if (saveTransactionCleared == null) {
    return enums.SaveTransactionCleared.swaggerGeneratedUnknown;
  }

  return enums.$SaveTransactionClearedMap.entries
          .firstWhere((element) => element.value == saveTransactionCleared,
              orElse: () => null)
          ?.key ??
      enums.SaveTransactionCleared.swaggerGeneratedUnknown;
}

List<String> saveTransactionClearedListToJson(
    List<enums.SaveTransactionCleared> saveTransactionCleared) {
  if (saveTransactionCleared == null) {
    return null;
  }

  return saveTransactionCleared
      .map((e) => enums.$SaveTransactionClearedMap[e])
      .toList();
}

List<enums.SaveTransactionCleared> saveTransactionClearedListFromJson(
    List saveTransactionCleared) {
  if (saveTransactionCleared == null) {
    return [];
  }

  return saveTransactionCleared
      .map((e) => saveTransactionClearedFromJson(e.toString()))
      .toList();
}

String saveTransactionFlagColorToJson(
    enums.SaveTransactionFlagColor saveTransactionFlagColor) {
  return enums.$SaveTransactionFlagColorMap[saveTransactionFlagColor];
}

enums.SaveTransactionFlagColor saveTransactionFlagColorFromJson(
    String saveTransactionFlagColor) {
  if (saveTransactionFlagColor == null) {
    return enums.SaveTransactionFlagColor.swaggerGeneratedUnknown;
  }

  return enums.$SaveTransactionFlagColorMap.entries
          .firstWhere((element) => element.value == saveTransactionFlagColor,
              orElse: () => null)
          ?.key ??
      enums.SaveTransactionFlagColor.swaggerGeneratedUnknown;
}

List<String> saveTransactionFlagColorListToJson(
    List<enums.SaveTransactionFlagColor> saveTransactionFlagColor) {
  if (saveTransactionFlagColor == null) {
    return null;
  }

  return saveTransactionFlagColor
      .map((e) => enums.$SaveTransactionFlagColorMap[e])
      .toList();
}

List<enums.SaveTransactionFlagColor> saveTransactionFlagColorListFromJson(
    List saveTransactionFlagColor) {
  if (saveTransactionFlagColor == null) {
    return [];
  }

  return saveTransactionFlagColor
      .map((e) => saveTransactionFlagColorFromJson(e.toString()))
      .toList();
}

String transactionSummaryClearedToJson(
    enums.TransactionSummaryCleared transactionSummaryCleared) {
  return enums.$TransactionSummaryClearedMap[transactionSummaryCleared];
}

enums.TransactionSummaryCleared transactionSummaryClearedFromJson(
    String transactionSummaryCleared) {
  if (transactionSummaryCleared == null) {
    return enums.TransactionSummaryCleared.swaggerGeneratedUnknown;
  }

  return enums.$TransactionSummaryClearedMap.entries
          .firstWhere((element) => element.value == transactionSummaryCleared,
              orElse: () => null)
          ?.key ??
      enums.TransactionSummaryCleared.swaggerGeneratedUnknown;
}

List<String> transactionSummaryClearedListToJson(
    List<enums.TransactionSummaryCleared> transactionSummaryCleared) {
  if (transactionSummaryCleared == null) {
    return null;
  }

  return transactionSummaryCleared
      .map((e) => enums.$TransactionSummaryClearedMap[e])
      .toList();
}

List<enums.TransactionSummaryCleared> transactionSummaryClearedListFromJson(
    List transactionSummaryCleared) {
  if (transactionSummaryCleared == null) {
    return [];
  }

  return transactionSummaryCleared
      .map((e) => transactionSummaryClearedFromJson(e.toString()))
      .toList();
}

String transactionSummaryFlagColorToJson(
    enums.TransactionSummaryFlagColor transactionSummaryFlagColor) {
  return enums.$TransactionSummaryFlagColorMap[transactionSummaryFlagColor];
}

enums.TransactionSummaryFlagColor transactionSummaryFlagColorFromJson(
    String transactionSummaryFlagColor) {
  if (transactionSummaryFlagColor == null) {
    return enums.TransactionSummaryFlagColor.swaggerGeneratedUnknown;
  }

  return enums.$TransactionSummaryFlagColorMap.entries
          .firstWhere((element) => element.value == transactionSummaryFlagColor,
              orElse: () => null)
          ?.key ??
      enums.TransactionSummaryFlagColor.swaggerGeneratedUnknown;
}

List<String> transactionSummaryFlagColorListToJson(
    List<enums.TransactionSummaryFlagColor> transactionSummaryFlagColor) {
  if (transactionSummaryFlagColor == null) {
    return null;
  }

  return transactionSummaryFlagColor
      .map((e) => enums.$TransactionSummaryFlagColorMap[e])
      .toList();
}

List<enums.TransactionSummaryFlagColor> transactionSummaryFlagColorListFromJson(
    List transactionSummaryFlagColor) {
  if (transactionSummaryFlagColor == null) {
    return [];
  }

  return transactionSummaryFlagColor
      .map((e) => transactionSummaryFlagColorFromJson(e.toString()))
      .toList();
}

String scheduledTransactionSummaryFrequencyToJson(
    enums.ScheduledTransactionSummaryFrequency
        scheduledTransactionSummaryFrequency) {
  return enums.$ScheduledTransactionSummaryFrequencyMap[
      scheduledTransactionSummaryFrequency];
}

enums.ScheduledTransactionSummaryFrequency
    scheduledTransactionSummaryFrequencyFromJson(
        String scheduledTransactionSummaryFrequency) {
  if (scheduledTransactionSummaryFrequency == null) {
    return enums.ScheduledTransactionSummaryFrequency.swaggerGeneratedUnknown;
  }

  return enums.$ScheduledTransactionSummaryFrequencyMap.entries
          .firstWhere(
              (element) =>
                  element.value == scheduledTransactionSummaryFrequency,
              orElse: () => null)
          ?.key ??
      enums.ScheduledTransactionSummaryFrequency.swaggerGeneratedUnknown;
}

List<String> scheduledTransactionSummaryFrequencyListToJson(
    List<enums.ScheduledTransactionSummaryFrequency>
        scheduledTransactionSummaryFrequency) {
  if (scheduledTransactionSummaryFrequency == null) {
    return null;
  }

  return scheduledTransactionSummaryFrequency
      .map((e) => enums.$ScheduledTransactionSummaryFrequencyMap[e])
      .toList();
}

List<enums.ScheduledTransactionSummaryFrequency>
    scheduledTransactionSummaryFrequencyListFromJson(
        List scheduledTransactionSummaryFrequency) {
  if (scheduledTransactionSummaryFrequency == null) {
    return [];
  }

  return scheduledTransactionSummaryFrequency
      .map((e) => scheduledTransactionSummaryFrequencyFromJson(e.toString()))
      .toList();
}

String scheduledTransactionSummaryFlagColorToJson(
    enums.ScheduledTransactionSummaryFlagColor
        scheduledTransactionSummaryFlagColor) {
  return enums.$ScheduledTransactionSummaryFlagColorMap[
      scheduledTransactionSummaryFlagColor];
}

enums.ScheduledTransactionSummaryFlagColor
    scheduledTransactionSummaryFlagColorFromJson(
        String scheduledTransactionSummaryFlagColor) {
  if (scheduledTransactionSummaryFlagColor == null) {
    return enums.ScheduledTransactionSummaryFlagColor.swaggerGeneratedUnknown;
  }

  return enums.$ScheduledTransactionSummaryFlagColorMap.entries
          .firstWhere(
              (element) =>
                  element.value == scheduledTransactionSummaryFlagColor,
              orElse: () => null)
          ?.key ??
      enums.ScheduledTransactionSummaryFlagColor.swaggerGeneratedUnknown;
}

List<String> scheduledTransactionSummaryFlagColorListToJson(
    List<enums.ScheduledTransactionSummaryFlagColor>
        scheduledTransactionSummaryFlagColor) {
  if (scheduledTransactionSummaryFlagColor == null) {
    return null;
  }

  return scheduledTransactionSummaryFlagColor
      .map((e) => enums.$ScheduledTransactionSummaryFlagColorMap[e])
      .toList();
}

List<enums.ScheduledTransactionSummaryFlagColor>
    scheduledTransactionSummaryFlagColorListFromJson(
        List scheduledTransactionSummaryFlagColor) {
  if (scheduledTransactionSummaryFlagColor == null) {
    return [];
  }

  return scheduledTransactionSummaryFlagColor
      .map((e) => scheduledTransactionSummaryFlagColorFromJson(e.toString()))
      .toList();
}

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class CustomJsonDecoder {
  CustomJsonDecoder(this.factories);

  final Map<Type, JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values) as T;
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final jsonDecoder = CustomJsonDecoder(YnabJsonDecoderMappings);
