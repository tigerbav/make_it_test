import 'package:easy_localization/easy_localization.dart';
import 'package:make_it/generated/locale_keys.g.dart';

enum TriggerType { trigger1, trigger2 }

extension TriggerTypeEx on TriggerType {
  String get title {
    switch (this) {
      case TriggerType.trigger1:
        return LocaleKeys.select_trigger.tr(args: ['1']);
      case TriggerType.trigger2:
        return LocaleKeys.select_trigger.tr(args: ['2']);
    }
  }
}
