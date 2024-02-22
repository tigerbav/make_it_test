import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/utils/utils.dart';
import 'package:make_it/common/widgets/card_button.dart';
import 'package:make_it/flows/notifications/presentation/logic/add_notification/add_notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/logic/icon_selector/icon_selector_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/add_notification/icon_time_selector.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class IconSelection extends StatelessWidget {
  const IconSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.icon.tr(),
            style: AppStyles.shared.body2Medium,
          ),
          SizedBox(height: 6.sp),
          Row(
            children: [
              BlocBuilder<AddNotificationCubit, AddNotificationState>(
                buildWhen: (p, c) => p.icon != c.icon || p.bgColor != c.bgColor,
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: state.bgColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.shared.grey),
                    ),
                    child: Icon(
                      state.icon ?? Icons.image_outlined,
                      color: state.icon == null
                          ? AppColors.shared.grey
                          : AppColors.shared.activeBtn,
                      size: 36.sp,
                    ),
                  );
                },
              ),
              SizedBox(width: 16.sp),
              CardButton(
                onPressed: () {
                  Utils.showModalBottom(
                    context,
                    MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: context.read<IconSelectorCubit>(),
                        ),
                        BlocProvider.value(
                          value: context.read<AddNotificationCubit>(),
                        ),
                      ],
                      child: const IconTimeSelector(),
                    ),
                  );
                },
                text: LocaleKeys.select_icon.tr(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
