import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/services/navigation/app_router.dart';

class RecurringTimeWidget extends StatelessWidget {
  const RecurringTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: RecurringTimeType.values.length,
      itemBuilder: (_, index) => _Item(RecurringTimeType.values[index]),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.timeType);
  final RecurringTimeType timeType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.navigate(RecurringListRoute(
          timeType: timeType,
          notificationCubit: context.read<NotificationCubit>(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: AppColors.shared.lightGrey,
          border: Border.all(
            color: AppColors.shared.grey,
            width: 0.5.sp,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeType.title,
              style: AppStyles.shared.body1BoldBlack,
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppColors.shared.activeBtn,
            )
          ],
        ),
      ),
    );
  }
}
