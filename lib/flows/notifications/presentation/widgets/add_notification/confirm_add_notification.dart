import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/common/widgets/main_button.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/add_notification/add_notification_cubit.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class ConfirmAddNotification extends StatelessWidget {
  const ConfirmAddNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNotificationCubit, AddNotificationState>(
      buildWhen: (p, c) =>
          p.stringTime != c.stringTime || p.message != c.message,
      builder: (context, state) {
        late final cubit = context.read<AddNotificationCubit>();
        late final isOneTime = cubit.type == NotificationType.oneTime;

        final isNull = state.message == null ||
            state.message!.isEmpty ||
            (state.stringTime.contains('X') && isOneTime);

        return MainButton(
          onPressed: isNull ? null : () => cubit.addNotification(),
          text: LocaleKeys.confirm.tr(),
        );
      },
    );
  }
}
