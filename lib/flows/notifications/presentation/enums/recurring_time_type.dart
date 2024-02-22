import 'package:easy_localization/easy_localization.dart';
import 'package:make_it/generated/locale_keys.g.dart';

enum RecurringTimeType { oneMinute, threeMinutes, fiveMinutes }

extension RecurringTimeTypeEx on RecurringTimeType {
  String get title {
    switch (this) {
      case RecurringTimeType.oneMinute:
        return LocaleKeys.minute.tr(args: ['1']);
      case RecurringTimeType.threeMinutes:
        return LocaleKeys.minute.tr(args: ['3']);
      case RecurringTimeType.fiveMinutes:
        return LocaleKeys.minute.tr(args: ['5']);
    }
  }

  int get code {
    switch (this) {
      case RecurringTimeType.oneMinute:
        return 1;
      case RecurringTimeType.threeMinutes:
        return 3;
      case RecurringTimeType.fiveMinutes:
        return 5;
    }
  }

  static RecurringTimeType? fromApi(int id) {
    switch (id) {
      case 1:
        return RecurringTimeType.oneMinute;
      case 3:
        return RecurringTimeType.threeMinutes;
      case 5:
        return RecurringTimeType.fiveMinutes;
    }
    return null;
  }
}
