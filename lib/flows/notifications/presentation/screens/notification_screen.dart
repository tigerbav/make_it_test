import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/widgets/custom_app_bar.dart';
import 'package:make_it/flows/notifications/domain/repositories/notification_repositories.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/notification_list.dart';
import 'package:make_it/flows/notifications/presentation/widgets/notification/recurring_times_widget.dart';
import 'package:make_it/flows/notifications/presentation/widgets/notification/switcher_type_widget.dart';
import 'package:make_it/generated/locale_keys.g.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => NotificationCubit(ctx.read<NotificationRepository>()),
      child: const _NotificationView(),
    );
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.notifications.tr(),
        widget: const SwitcherTypeWidget(),
        height: 120.sp,
      ),
      backgroundColor: AppColors.shared.white,
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          buildWhen: (p, c) => p.currentType != c.currentType,
          builder: (context, state) {
            switch (state.currentType) {
              case NotificationType.oneTime:
                return BlocBuilder<NotificationCubit, NotificationState>(
                  buildWhen: (p, c) =>
                      p.currentType != c.currentType ||
                      p.modelsByType != c.modelsByType ||
                      p.isLoading != c.isLoading,
                  builder: (context, state) {
                    return NotificationList(
                      type: NotificationType.oneTime,
                      models: state.modelsByType,
                      isLoading: state.isLoading,
                      timeType: null,
                    );
                  },
                );
              case NotificationType.recurring:
                return const RecurringTimeWidget();
            }
          },
        ),
      ),
    );
  }
}
