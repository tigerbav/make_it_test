import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:make_it/generated/locale_keys.g.dart';

enum NotificationType { oneTime, recurring }

extension NotificationTypeEx on NotificationType {
  String get title {
    switch (this) {
      case NotificationType.oneTime:
        return LocaleKeys.one_time.tr();
      case NotificationType.recurring:
        return LocaleKeys.recurring.tr();
    }
  }

  IconData get icon {
    switch (this) {
      case NotificationType.oneTime:
        return Icons.timer_sharp;
      case NotificationType.recurring:
        return Icons.restore;
    }
  }

  int get code {
    switch (this) {
      case NotificationType.oneTime:
        return 1;
      case NotificationType.recurring:
        return 2;
    }
  }

  static NotificationType? fromApi(int id) {
    switch (id) {
      case 1:
        return NotificationType.oneTime;
      case 2:
        return NotificationType.recurring;
    }
    return null;
  }
}
