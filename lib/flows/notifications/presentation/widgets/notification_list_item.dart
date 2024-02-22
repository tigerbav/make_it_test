import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/widgets/card_button.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/text_description.dart';
import 'package:make_it/generated/locale_keys.g.dart';
import 'package:make_it/services/navigation/app_router.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.model,
  });

  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.shared.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(16.sp)),
        border: Border.all(color: AppColors.shared.activeBtn),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.icon != null)
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 8.sp),
                      padding: EdgeInsets.all(3.sp),
                      decoration: BoxDecoration(
                        color: model.color,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.shared.grey),
                      ),
                      child: Icon(
                        model.icon,
                        color: AppColors.shared.activeBtn,
                      ),
                    ),
                  TextDescription(
                    title: LocaleKeys.time.tr(),
                    text: model.stringTime,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    context.read<NotificationCubit>().removeNotification(model),
                child: Icon(
                  Icons.delete_forever,
                  color: AppColors.shared.red,
                ),
              )
            ],
          ),
          SizedBox(height: 8.sp),
          TextDescription(
            title: LocaleKeys.message.tr(),
            text: model.message,
            isExpanded: true,
          ),
          SizedBox(height: 16.sp),
          Row(
            children: [
              CardButton(
                text: LocaleKeys.select_trigger.tr(args: ['1']),
                onPressed: () => context.router.navigate(
                  TriggerRoute(triggerType: TriggerType.trigger1),
                ),
              ),
              SizedBox(width: 13.sp),
              CardButton(
                text: LocaleKeys.select_trigger.tr(args: ['2']),
                onPressed: () => context.router.navigate(
                  TriggerRoute(triggerType: TriggerType.trigger2),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
