// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ynab.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    error: json['error'] == null
        ? null
        : ErrorDetail.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error?.toJson());
  return val;
}

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return ErrorDetail(
    id: json['id'] as String,
    name: json['name'] as String,
    detail: json['detail'] as String,
  );
}

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('detail', instance.detail);
  return val;
}

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

DateFormat _$DateFormatFromJson(Map<String, dynamic> json) {
  return DateFormat(
    format: json['format'] as String,
  );
}

Map<String, dynamic> _$DateFormatToJson(DateFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('format', instance.format);
  return val;
}

CurrencyFormat _$CurrencyFormatFromJson(Map<String, dynamic> json) {
  return CurrencyFormat(
    isoCode: json['iso_code'] as String,
    exampleFormat: json['example_format'] as String,
    decimalDigits: json['decimal_digits'] as int ?? 36,
    decimalSeparator: json['decimal_separator'] as String,
    symbolFirst: json['symbol_first'] as bool,
    groupSeparator: json['group_separator'] as String,
    currencySymbol: json['currency_symbol'] as String,
    displaySymbol: json['display_symbol'] as bool,
  );
}

Map<String, dynamic> _$CurrencyFormatToJson(CurrencyFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('iso_code', instance.isoCode);
  writeNotNull('example_format', instance.exampleFormat);
  writeNotNull('decimal_digits', instance.decimalDigits);
  writeNotNull('decimal_separator', instance.decimalSeparator);
  writeNotNull('symbol_first', instance.symbolFirst);
  writeNotNull('group_separator', instance.groupSeparator);
  writeNotNull('currency_symbol', instance.currencySymbol);
  writeNotNull('display_symbol', instance.displaySymbol);
  return val;
}

BudgetSummaryResponse _$BudgetSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return BudgetSummaryResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$BudgetSummaryResponseToJson(
    BudgetSummaryResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

BudgetSummary _$BudgetSummaryFromJson(Map<String, dynamic> json) {
  return BudgetSummary(
    id: json['id'] as String,
    name: json['name'] as String,
    lastModifiedOn: json['last_modified_on'] == null
        ? null
        : DateTime.parse(json['last_modified_on'] as String),
    firstMonth: json['first_month'] == null
        ? null
        : DateTime.parse(json['first_month'] as String),
    lastMonth: json['last_month'] == null
        ? null
        : DateTime.parse(json['last_month'] as String),
    dateFormat: json['date_format'] == null
        ? null
        : DateFormat.fromJson(json['date_format'] as Map<String, dynamic>),
    currencyFormat: json['currency_format'] == null
        ? null
        : CurrencyFormat.fromJson(
            json['currency_format'] as Map<String, dynamic>),
    accounts: (json['accounts'] as List)
            ?.map((e) =>
                e == null ? null : Account.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$BudgetSummaryToJson(BudgetSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('last_modified_on', instance.lastModifiedOn?.toIso8601String());
  writeNotNull('first_month', instance.firstMonth?.toIso8601String());
  writeNotNull('last_month', instance.lastMonth?.toIso8601String());
  writeNotNull('date_format', instance.dateFormat?.toJson());
  writeNotNull('currency_format', instance.currencyFormat?.toJson());
  writeNotNull(
      'accounts', instance.accounts?.map((e) => e?.toJson())?.toList());
  return val;
}

BudgetDetailResponse _$BudgetDetailResponseFromJson(Map<String, dynamic> json) {
  return BudgetDetailResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$BudgetDetailResponseToJson(
    BudgetDetailResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

BudgetDetail _$BudgetDetailFromJson(Map<String, dynamic> json) {
  return BudgetDetail();
}

Map<String, dynamic> _$BudgetDetailToJson(BudgetDetail instance) =>
    <String, dynamic>{};

BudgetSettingsResponse _$BudgetSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return BudgetSettingsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$BudgetSettingsResponseToJson(
    BudgetSettingsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

BudgetSettings _$BudgetSettingsFromJson(Map<String, dynamic> json) {
  return BudgetSettings(
    dateFormat: json['date_format'] == null
        ? null
        : DateFormat.fromJson(json['date_format'] as Map<String, dynamic>),
    currencyFormat: json['currency_format'] == null
        ? null
        : CurrencyFormat.fromJson(
            json['currency_format'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BudgetSettingsToJson(BudgetSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date_format', instance.dateFormat?.toJson());
  writeNotNull('currency_format', instance.currencyFormat?.toJson());
  return val;
}

AccountsResponse _$AccountsResponseFromJson(Map<String, dynamic> json) {
  return AccountsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$AccountsResponseToJson(AccountsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  return AccountResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as String,
    name: json['name'] as String,
    type: accountTypeFromJson(json['type'] as String),
    onBudget: json['on_budget'] as bool,
    closed: json['closed'] as bool,
    note: json['note'] as String,
    balance: json['balance'] as int ?? 36,
    clearedBalance: json['cleared_balance'] as int ?? 36,
    unclearedBalance: json['uncleared_balance'] as int ?? 36,
    transferPayeeId: json['transfer_payee_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', accountTypeToJson(instance.type));
  writeNotNull('on_budget', instance.onBudget);
  writeNotNull('closed', instance.closed);
  writeNotNull('note', instance.note);
  writeNotNull('balance', instance.balance);
  writeNotNull('cleared_balance', instance.clearedBalance);
  writeNotNull('uncleared_balance', instance.unclearedBalance);
  writeNotNull('transfer_payee_id', instance.transferPayeeId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

SaveAccountWrapper _$SaveAccountWrapperFromJson(Map<String, dynamic> json) {
  return SaveAccountWrapper(
    account: json['account'] == null
        ? null
        : SaveAccount.fromJson(json['account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaveAccountWrapperToJson(SaveAccountWrapper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account?.toJson());
  return val;
}

SaveAccount _$SaveAccountFromJson(Map<String, dynamic> json) {
  return SaveAccount(
    name: json['name'] as String,
    type: saveAccountTypeFromJson(json['type'] as String),
    balance: json['balance'] as int ?? 36,
  );
}

Map<String, dynamic> _$SaveAccountToJson(SaveAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', saveAccountTypeToJson(instance.type));
  writeNotNull('balance', instance.balance);
  return val;
}

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) {
  return CategoriesResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

CategoryGroupWithCategories _$CategoryGroupWithCategoriesFromJson(
    Map<String, dynamic> json) {
  return CategoryGroupWithCategories();
}

Map<String, dynamic> _$CategoryGroupWithCategoriesToJson(
        CategoryGroupWithCategories instance) =>
    <String, dynamic>{};

CategoryGroup _$CategoryGroupFromJson(Map<String, dynamic> json) {
  return CategoryGroup(
    id: json['id'] as String,
    name: json['name'] as String,
    hidden: json['hidden'] as bool,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$CategoryGroupToJson(CategoryGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('hidden', instance.hidden);
  writeNotNull('deleted', instance.deleted);
  return val;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as String,
    categoryGroupId: json['category_group_id'] as String,
    name: json['name'] as String,
    hidden: json['hidden'] as bool,
    originalCategoryGroupId: json['original_category_group_id'] as String,
    note: json['note'] as String,
    budgeted: json['budgeted'] as int ?? 36,
    activity: json['activity'] as int ?? 36,
    balance: json['balance'] as int ?? 36,
    goalType:
        _$enumDecodeNullable(_$CategoryGoalTypeEnumMap, json['goal_type']),
    goalCreationMonth: json['goal_creation_month'] == null
        ? null
        : DateTime.parse(json['goal_creation_month'] as String),
    goalTarget: json['goal_target'] as int ?? 36,
    goalTargetMonth: json['goal_target_month'] == null
        ? null
        : DateTime.parse(json['goal_target_month'] as String),
    goalPercentageComplete: json['goal_percentage_complete'] as int ?? 36,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('category_group_id', instance.categoryGroupId);
  writeNotNull('name', instance.name);
  writeNotNull('hidden', instance.hidden);
  writeNotNull('original_category_group_id', instance.originalCategoryGroupId);
  writeNotNull('note', instance.note);
  writeNotNull('budgeted', instance.budgeted);
  writeNotNull('activity', instance.activity);
  writeNotNull('balance', instance.balance);
  writeNotNull('goal_type', _$CategoryGoalTypeEnumMap[instance.goalType]);
  writeNotNull(
      'goal_creation_month', instance.goalCreationMonth?.toIso8601String());
  writeNotNull('goal_target', instance.goalTarget);
  writeNotNull(
      'goal_target_month', instance.goalTargetMonth?.toIso8601String());
  writeNotNull('goal_percentage_complete', instance.goalPercentageComplete);
  writeNotNull('deleted', instance.deleted);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CategoryGoalTypeEnumMap = {
  enums.CategoryGoalType.swaggerGeneratedUnknown: 'swaggerGeneratedUnknown',
  enums.CategoryGoalType.tb: 'TB',
  enums.CategoryGoalType.tbd: 'TBD',
  enums.CategoryGoalType.mf: 'MF',
  enums.CategoryGoalType.need: 'NEED',
  enums.CategoryGoalType.$null: 'null',
};

SaveCategoryResponse _$SaveCategoryResponseFromJson(Map<String, dynamic> json) {
  return SaveCategoryResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$SaveCategoryResponseToJson(
    SaveCategoryResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

PayeesResponse _$PayeesResponseFromJson(Map<String, dynamic> json) {
  return PayeesResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$PayeesResponseToJson(PayeesResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

PayeeResponse _$PayeeResponseFromJson(Map<String, dynamic> json) {
  return PayeeResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$PayeeResponseToJson(PayeeResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

Payee _$PayeeFromJson(Map<String, dynamic> json) {
  return Payee(
    id: json['id'] as String,
    name: json['name'] as String,
    transferAccountId: json['transfer_account_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$PayeeToJson(Payee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('transfer_account_id', instance.transferAccountId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

PayeeLocationsResponse _$PayeeLocationsResponseFromJson(
    Map<String, dynamic> json) {
  return PayeeLocationsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$PayeeLocationsResponseToJson(
    PayeeLocationsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

PayeeLocationResponse _$PayeeLocationResponseFromJson(
    Map<String, dynamic> json) {
  return PayeeLocationResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$PayeeLocationResponseToJson(
    PayeeLocationResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

PayeeLocation _$PayeeLocationFromJson(Map<String, dynamic> json) {
  return PayeeLocation(
    id: json['id'] as String,
    payeeId: json['payee_id'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$PayeeLocationToJson(PayeeLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('deleted', instance.deleted);
  return val;
}

TransactionsResponse _$TransactionsResponseFromJson(Map<String, dynamic> json) {
  return TransactionsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$TransactionsResponseToJson(
    TransactionsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

HybridTransactionsResponse _$HybridTransactionsResponseFromJson(
    Map<String, dynamic> json) {
  return HybridTransactionsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$HybridTransactionsResponseToJson(
    HybridTransactionsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

SaveTransactionWrapper _$SaveTransactionWrapperFromJson(
    Map<String, dynamic> json) {
  return SaveTransactionWrapper(
    transaction: json['transaction'] == null
        ? null
        : SaveTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaveTransactionWrapperToJson(
    SaveTransactionWrapper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transaction', instance.transaction?.toJson());
  return val;
}

SaveTransactionsWrapper _$SaveTransactionsWrapperFromJson(
    Map<String, dynamic> json) {
  return SaveTransactionsWrapper(
    transaction: json['transaction'] == null
        ? null
        : SaveTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
    transactions: (json['transactions'] as List)
            ?.map((e) => e == null
                ? null
                : SaveTransaction.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$SaveTransactionsWrapperToJson(
    SaveTransactionsWrapper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transaction', instance.transaction?.toJson());
  writeNotNull(
      'transactions', instance.transactions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateTransactionsWrapper _$UpdateTransactionsWrapperFromJson(
    Map<String, dynamic> json) {
  return UpdateTransactionsWrapper(
    transactions: (json['transactions'] as List)
            ?.map((e) => e == null
                ? null
                : UpdateTransaction.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$UpdateTransactionsWrapperToJson(
    UpdateTransactionsWrapper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'transactions', instance.transactions?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateTransaction _$UpdateTransactionFromJson(Map<String, dynamic> json) {
  return UpdateTransaction();
}

Map<String, dynamic> _$UpdateTransactionToJson(UpdateTransaction instance) =>
    <String, dynamic>{};

SaveTransaction _$SaveTransactionFromJson(Map<String, dynamic> json) {
  return SaveTransaction(
    accountId: json['account_id'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    amount: json['amount'] as int ?? 36,
    payeeId: json['payee_id'] as String,
    payeeName: json['payee_name'] as String,
    categoryId: json['category_id'] as String,
    memo: json['memo'] as String,
    cleared: saveTransactionClearedFromJson(json['cleared'] as String),
    approved: json['approved'] as bool,
    flagColor: _$enumDecodeNullable(
        _$SaveTransactionFlagColorEnumMap, json['flag_color']),
    importId: json['import_id'] as String,
    subtransactions: (json['subtransactions'] as List)
            ?.map((e) => e == null
                ? null
                : SaveSubTransaction.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$SaveTransactionToJson(SaveTransaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account_id', instance.accountId);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('amount', instance.amount);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('payee_name', instance.payeeName);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('memo', instance.memo);
  writeNotNull('cleared', saveTransactionClearedToJson(instance.cleared));
  writeNotNull('approved', instance.approved);
  writeNotNull(
      'flag_color', _$SaveTransactionFlagColorEnumMap[instance.flagColor]);
  writeNotNull('import_id', instance.importId);
  writeNotNull('subtransactions',
      instance.subtransactions?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$SaveTransactionFlagColorEnumMap = {
  enums.SaveTransactionFlagColor.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown',
  enums.SaveTransactionFlagColor.red: 'red',
  enums.SaveTransactionFlagColor.orange: 'orange',
  enums.SaveTransactionFlagColor.yellow: 'yellow',
  enums.SaveTransactionFlagColor.green: 'green',
  enums.SaveTransactionFlagColor.blue: 'blue',
  enums.SaveTransactionFlagColor.purple: 'purple',
  enums.SaveTransactionFlagColor.$null: 'null',
};

SaveSubTransaction _$SaveSubTransactionFromJson(Map<String, dynamic> json) {
  return SaveSubTransaction(
    amount: json['amount'] as int ?? 36,
    payeeId: json['payee_id'] as String,
    payeeName: json['payee_name'] as String,
    categoryId: json['category_id'] as String,
    memo: json['memo'] as String,
  );
}

Map<String, dynamic> _$SaveSubTransactionToJson(SaveSubTransaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('payee_name', instance.payeeName);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('memo', instance.memo);
  return val;
}

SaveTransactionsResponse _$SaveTransactionsResponseFromJson(
    Map<String, dynamic> json) {
  return SaveTransactionsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$SaveTransactionsResponseToJson(
    SaveTransactionsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$TransactionResponseToJson(TransactionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

TransactionSummary _$TransactionSummaryFromJson(Map<String, dynamic> json) {
  return TransactionSummary(
    id: json['id'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    amount: json['amount'] as int ?? 36,
    memo: json['memo'] as String,
    cleared: transactionSummaryClearedFromJson(json['cleared'] as String),
    approved: json['approved'] as bool,
    flagColor: _$enumDecodeNullable(
        _$TransactionSummaryFlagColorEnumMap, json['flag_color']),
    accountId: json['account_id'] as String,
    payeeId: json['payee_id'] as String,
    categoryId: json['category_id'] as String,
    transferAccountId: json['transfer_account_id'] as String,
    transferTransactionId: json['transfer_transaction_id'] as String,
    matchedTransactionId: json['matched_transaction_id'] as String,
    importId: json['import_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$TransactionSummaryToJson(TransactionSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('amount', instance.amount);
  writeNotNull('memo', instance.memo);
  writeNotNull('cleared', transactionSummaryClearedToJson(instance.cleared));
  writeNotNull('approved', instance.approved);
  writeNotNull(
      'flag_color', _$TransactionSummaryFlagColorEnumMap[instance.flagColor]);
  writeNotNull('account_id', instance.accountId);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('transfer_account_id', instance.transferAccountId);
  writeNotNull('transfer_transaction_id', instance.transferTransactionId);
  writeNotNull('matched_transaction_id', instance.matchedTransactionId);
  writeNotNull('import_id', instance.importId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

const _$TransactionSummaryFlagColorEnumMap = {
  enums.TransactionSummaryFlagColor.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown',
  enums.TransactionSummaryFlagColor.red: 'red',
  enums.TransactionSummaryFlagColor.orange: 'orange',
  enums.TransactionSummaryFlagColor.yellow: 'yellow',
  enums.TransactionSummaryFlagColor.green: 'green',
  enums.TransactionSummaryFlagColor.blue: 'blue',
  enums.TransactionSummaryFlagColor.purple: 'purple',
  enums.TransactionSummaryFlagColor.$null: 'null',
};

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) {
  return TransactionDetail();
}

Map<String, dynamic> _$TransactionDetailToJson(TransactionDetail instance) =>
    <String, dynamic>{};

HybridTransaction _$HybridTransactionFromJson(Map<String, dynamic> json) {
  return HybridTransaction();
}

Map<String, dynamic> _$HybridTransactionToJson(HybridTransaction instance) =>
    <String, dynamic>{};

SaveMonthCategoryWrapper _$SaveMonthCategoryWrapperFromJson(
    Map<String, dynamic> json) {
  return SaveMonthCategoryWrapper(
    category: json['category'] == null
        ? null
        : SaveMonthCategory.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaveMonthCategoryWrapperToJson(
    SaveMonthCategoryWrapper instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', instance.category?.toJson());
  return val;
}

SaveMonthCategory _$SaveMonthCategoryFromJson(Map<String, dynamic> json) {
  return SaveMonthCategory(
    budgeted: json['budgeted'] as int ?? 36,
  );
}

Map<String, dynamic> _$SaveMonthCategoryToJson(SaveMonthCategory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('budgeted', instance.budgeted);
  return val;
}

TransactionsImportResponse _$TransactionsImportResponseFromJson(
    Map<String, dynamic> json) {
  return TransactionsImportResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$TransactionsImportResponseToJson(
    TransactionsImportResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

BulkResponse _$BulkResponseFromJson(Map<String, dynamic> json) {
  return BulkResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$BulkResponseToJson(BulkResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

BulkTransactions _$BulkTransactionsFromJson(Map<String, dynamic> json) {
  return BulkTransactions(
    transactions: (json['transactions'] as List)
            ?.map((e) => e == null
                ? null
                : SaveTransaction.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$BulkTransactionsToJson(BulkTransactions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'transactions', instance.transactions?.map((e) => e?.toJson())?.toList());
  return val;
}

SubTransaction _$SubTransactionFromJson(Map<String, dynamic> json) {
  return SubTransaction(
    id: json['id'] as String,
    transactionId: json['transaction_id'] as String,
    amount: json['amount'] as int ?? 36,
    memo: json['memo'] as String,
    payeeId: json['payee_id'] as String,
    payeeName: json['payee_name'] as String,
    categoryId: json['category_id'] as String,
    categoryName: json['category_name'] as String,
    transferAccountId: json['transfer_account_id'] as String,
    transferTransactionId: json['transfer_transaction_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$SubTransactionToJson(SubTransaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('transaction_id', instance.transactionId);
  writeNotNull('amount', instance.amount);
  writeNotNull('memo', instance.memo);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('payee_name', instance.payeeName);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('category_name', instance.categoryName);
  writeNotNull('transfer_account_id', instance.transferAccountId);
  writeNotNull('transfer_transaction_id', instance.transferTransactionId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

ScheduledTransactionsResponse _$ScheduledTransactionsResponseFromJson(
    Map<String, dynamic> json) {
  return ScheduledTransactionsResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$ScheduledTransactionsResponseToJson(
    ScheduledTransactionsResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

ScheduledTransactionResponse _$ScheduledTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return ScheduledTransactionResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$ScheduledTransactionResponseToJson(
    ScheduledTransactionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

ScheduledTransactionSummary _$ScheduledTransactionSummaryFromJson(
    Map<String, dynamic> json) {
  return ScheduledTransactionSummary(
    id: json['id'] as String,
    dateFirst: json['date_first'] == null
        ? null
        : DateTime.parse(json['date_first'] as String),
    dateNext: json['date_next'] == null
        ? null
        : DateTime.parse(json['date_next'] as String),
    frequency: scheduledTransactionSummaryFrequencyFromJson(
        json['frequency'] as String),
    amount: json['amount'] as int ?? 36,
    memo: json['memo'] as String,
    flagColor: _$enumDecodeNullable(
        _$ScheduledTransactionSummaryFlagColorEnumMap, json['flag_color']),
    accountId: json['account_id'] as String,
    payeeId: json['payee_id'] as String,
    categoryId: json['category_id'] as String,
    transferAccountId: json['transfer_account_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$ScheduledTransactionSummaryToJson(
    ScheduledTransactionSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('date_first', instance.dateFirst?.toIso8601String());
  writeNotNull('date_next', instance.dateNext?.toIso8601String());
  writeNotNull('frequency',
      scheduledTransactionSummaryFrequencyToJson(instance.frequency));
  writeNotNull('amount', instance.amount);
  writeNotNull('memo', instance.memo);
  writeNotNull('flag_color',
      _$ScheduledTransactionSummaryFlagColorEnumMap[instance.flagColor]);
  writeNotNull('account_id', instance.accountId);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('transfer_account_id', instance.transferAccountId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

const _$ScheduledTransactionSummaryFlagColorEnumMap = {
  enums.ScheduledTransactionSummaryFlagColor.swaggerGeneratedUnknown:
      'swaggerGeneratedUnknown',
  enums.ScheduledTransactionSummaryFlagColor.red: 'red',
  enums.ScheduledTransactionSummaryFlagColor.orange: 'orange',
  enums.ScheduledTransactionSummaryFlagColor.yellow: 'yellow',
  enums.ScheduledTransactionSummaryFlagColor.green: 'green',
  enums.ScheduledTransactionSummaryFlagColor.blue: 'blue',
  enums.ScheduledTransactionSummaryFlagColor.purple: 'purple',
  enums.ScheduledTransactionSummaryFlagColor.$null: 'null',
};

ScheduledTransactionDetail _$ScheduledTransactionDetailFromJson(
    Map<String, dynamic> json) {
  return ScheduledTransactionDetail();
}

Map<String, dynamic> _$ScheduledTransactionDetailToJson(
        ScheduledTransactionDetail instance) =>
    <String, dynamic>{};

ScheduledSubTransaction _$ScheduledSubTransactionFromJson(
    Map<String, dynamic> json) {
  return ScheduledSubTransaction(
    id: json['id'] as String,
    scheduledTransactionId: json['scheduled_transaction_id'] as String,
    amount: json['amount'] as int ?? 36,
    memo: json['memo'] as String,
    payeeId: json['payee_id'] as String,
    categoryId: json['category_id'] as String,
    transferAccountId: json['transfer_account_id'] as String,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$ScheduledSubTransactionToJson(
    ScheduledSubTransaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('scheduled_transaction_id', instance.scheduledTransactionId);
  writeNotNull('amount', instance.amount);
  writeNotNull('memo', instance.memo);
  writeNotNull('payee_id', instance.payeeId);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('transfer_account_id', instance.transferAccountId);
  writeNotNull('deleted', instance.deleted);
  return val;
}

MonthSummariesResponse _$MonthSummariesResponseFromJson(
    Map<String, dynamic> json) {
  return MonthSummariesResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$MonthSummariesResponseToJson(
    MonthSummariesResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

MonthDetailResponse _$MonthDetailResponseFromJson(Map<String, dynamic> json) {
  return MonthDetailResponse(
    data: json['data'],
  );
}

Map<String, dynamic> _$MonthDetailResponseToJson(MonthDetailResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  return val;
}

MonthSummary _$MonthSummaryFromJson(Map<String, dynamic> json) {
  return MonthSummary(
    month:
        json['month'] == null ? null : DateTime.parse(json['month'] as String),
    note: json['note'] as String,
    income: json['income'] as int ?? 36,
    budgeted: json['budgeted'] as int ?? 36,
    activity: json['activity'] as int ?? 36,
    toBeBudgeted: json['to_be_budgeted'] as int ?? 36,
    ageOfMoney: json['age_of_money'] as int ?? 36,
    deleted: json['deleted'] as bool,
  );
}

Map<String, dynamic> _$MonthSummaryToJson(MonthSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('month', instance.month?.toIso8601String());
  writeNotNull('note', instance.note);
  writeNotNull('income', instance.income);
  writeNotNull('budgeted', instance.budgeted);
  writeNotNull('activity', instance.activity);
  writeNotNull('to_be_budgeted', instance.toBeBudgeted);
  writeNotNull('age_of_money', instance.ageOfMoney);
  writeNotNull('deleted', instance.deleted);
  return val;
}

MonthDetail _$MonthDetailFromJson(Map<String, dynamic> json) {
  return MonthDetail();
}

Map<String, dynamic> _$MonthDetailToJson(MonthDetail instance) =>
    <String, dynamic>{};
