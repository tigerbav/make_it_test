import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/widgets/app_refresh_indicator.dart';
import 'package:make_it/common/widgets/main_button.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/notification_list_item.dart';
import 'package:make_it/generated/locale_keys.g.dart';
import 'package:make_it/services/navigation/app_router.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({
    super.key,
    required this.isLoading,
    required this.models,
    required this.type,
    required this.timeType,
  });

  final bool isLoading;
  final List<NotificationModel> models;
  final NotificationType type;
  final RecurringTimeType? timeType;

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return AppRefreshIndicator(
      onRefresh: () =>
          context.read<NotificationCubit>().loadNotifications(refresh: true),
      child: ListView(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          if (widget.models.isNotEmpty) SizedBox(height: 16.sp),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            itemCount: widget.models.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: 16.sp),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.router.navigate(AddNotificationRoute(
                    type: widget.type,
                    timeType: widget.timeType,
                    model: widget.models[index],
                  ));
                },
                child: NotificationListItem(model: widget.models[index]),
              );
            },
          ),
          MainButton(
            isSmall: true,
            text: LocaleKeys.add_new_notification.tr(),
            onPressed: () => context.router.navigate(
              AddNotificationRoute(
                type: widget.type,
                timeType: widget.timeType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
