import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';

class SwitcherTypeWidget extends StatelessWidget {
  const SwitcherTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.shared.black,
      child: Container(
        margin: EdgeInsets.all(16.sp),
        padding: EdgeInsets.all(4.sp),
        height: 48.sp,
        decoration: BoxDecoration(
          color: AppColors.shared.lightGrey,
          border: Border.all(color: AppColors.shared.grey),
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        ),
        child: Row(
          children: List.generate(
            NotificationType.values.length,
            (i) => Expanded(child: _Item(NotificationType.values[i])),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.type);

  final NotificationType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<NotificationCubit>().setType(type),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        buildWhen: (p, c) => p.currentType != c.currentType,
        builder: (context, state) {
          final isActive = state.currentType == type;
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive ? AppColors.shared.activeBtn : null,
              borderRadius: BorderRadius.all(Radius.circular(6.sp)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type.icon,
                  color: isActive
                      ? AppColors.shared.white
                      : AppColors.shared.black,
                ),
                SizedBox(width: 6.sp),
                Text(
                  type.title,
                  style: isActive
                      ? AppStyles.shared.body1Bold
                      : AppStyles.shared.body1Medium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
