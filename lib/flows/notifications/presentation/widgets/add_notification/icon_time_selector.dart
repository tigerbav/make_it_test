import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/widgets/main_button.dart';
import 'package:make_it/flows/notifications/presentation/logic/add_notification/add_notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/logic/icon_selector/icon_selector_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/add_notification/icon_bg_selector.dart';
import 'package:make_it/flows/notifications/presentation/widgets/add_notification/icon_data_selector.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class IconTimeSelector extends StatelessWidget {
  const IconTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.icon_style.tr(),
              style: AppStyles.shared.h3Bold,
            ),
            GestureDetector(
              onTap: context.router.pop,
              child: Icon(
                Icons.cancel,
                color: AppColors.shared.activeBtn,
              ),
            ),
          ],
        ),
        SizedBox(width: 16.sp),
        Divider(color: AppColors.shared.lightGrey),
        SizedBox(width: 16.sp),
        Text(
          LocaleKeys.background_colors.tr(),
          style: AppStyles.shared.body1Medium,
        ),
        SizedBox(height: 11.sp),
        const IconBgSelector(),
        SizedBox(height: 16.sp),
        Text(
          LocaleKeys.select_icons.tr(),
          style: AppStyles.shared.body1Medium,
        ),
        SizedBox(height: 11.sp),
        const IconDataSelector(),
        SizedBox(height: 80.sp),
        MainButton(
          onPressed: () {
            final state = context.read<IconSelectorCubit>().state;

            context.read<AddNotificationCubit>().saveChanges(
                  state.color,
                  state.icon,
                );
            context.router.pop();
          },
          deleteVerticalPadding: true,
          text: LocaleKeys.save_changes.tr(),
        ),
      ],
    );
  }
}
