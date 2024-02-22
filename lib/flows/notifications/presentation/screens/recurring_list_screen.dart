import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/common/widgets/custom_app_bar.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/notification_list.dart';

@RoutePage()
class RecurringListScreen extends StatelessWidget {
  const RecurringListScreen({
    super.key,
    required this.timeType,
    required this.notificationCubit,
  });

  final RecurringTimeType timeType;
  final NotificationCubit notificationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: notificationCubit,
      child: Scaffold(
        appBar: CustomAppBar(text: timeType.title),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            return NotificationList(
              isLoading: state.isLoading,
              type: NotificationType.recurring,
              models: state.modelsByRecurringTimeType(timeType),
              timeType: timeType,
            );
          },
        ),
      ),
    );
  }
}
