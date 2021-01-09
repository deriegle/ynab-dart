extension YNABDateTime on DateTime {
  /// Returns DateTime to string compatible with YNAB
  String toYNABFormat() => toIso8601String().substring(0, 10);
}
