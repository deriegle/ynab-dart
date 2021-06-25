import 'package:ynab/models/json.dart';
import 'package:ynab/extensions/ynab_datetime.dart';

enum TransactionClearedStatus { cleared, uncleared, reconciled }

extension TransactionClearedStatusName on TransactionClearedStatus {
  static TransactionClearedStatus fromString(String str) {
    final map = {
      'cleared': TransactionClearedStatus.cleared,
      'reconciled': TransactionClearedStatus.reconciled,
      'uncleared': TransactionClearedStatus.uncleared,
    };

    return map[str.toLowerCase()];
  }

  String get name {
    final map = {
      TransactionClearedStatus.cleared: 'cleared',
      TransactionClearedStatus.reconciled: 'reconciled',
      TransactionClearedStatus.uncleared: 'uncleared',
    };

    return map[this];
  }
}

enum TransactionFlagColor { red, orange, yellow, green, blue, purple }

extension TransactionFlagColorName on TransactionFlagColor {
  static TransactionFlagColor fromString(String str) {
    final map = {
      'red': TransactionFlagColor.red,
      'orange': TransactionFlagColor.orange,
      'yellow': TransactionFlagColor.yellow,
      'green': TransactionFlagColor.green,
      'blue': TransactionFlagColor.blue,
      'purple': TransactionFlagColor.purple,
    };

    return map[str.toLowerCase()];
  }

  String get name {
    final map = {
      TransactionFlagColor.red: 'red',
      TransactionFlagColor.orange: 'orange',
      TransactionFlagColor.yellow: 'yellow',
      TransactionFlagColor.green: 'green',
      TransactionFlagColor.blue: 'blue',
      TransactionFlagColor.purple: 'purple',
    };

    return map[this];
  }
}

class Transaction implements JsonEncodable {
  final String id;
  final String accountId;
  final DateTime date;
  final int amount;
  final String payeeId;
  final String payeeName;
  final String categoryId;
  final String memo;
  final TransactionClearedStatus cleared;
  final bool approved;
  final String flagColor;
  final String importId;
  final List<Subtransaction> subtractions;

  Transaction({
    this.id,
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
    this.subtractions,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'account_id': accountId,
      'date': date.toYNABFormat(),
      'amount': amount,
      'payee_id': payeeId,
      'payee_name': payeeName,
      'category_id': categoryId,
      'memo': memo,
      'cleared': cleared?.name,
      'approved': approved,
      'import_id': importId,
      'subtransactions': subtractions?.map((s) => s.toJson())?.toList(),
    };
  }
}

class Subtransaction implements JsonEncodable {
  final String id;
  final int amount;
  final String payeeId;
  final String payeeName;
  final String categoryId;
  final String memo;

  Subtransaction({
    this.id,
    this.amount,
    this.payeeId,
    this.payeeName,
    this.categoryId,
    this.memo,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'amount': 0,
      'payee_id': payeeId,
      'payee_name': payeeName,
      'category_id': categoryId,
      'memo': memo
    };
  }
}
