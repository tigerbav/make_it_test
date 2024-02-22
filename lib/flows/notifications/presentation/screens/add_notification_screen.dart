import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/utils/utils.dart';
import 'package:make_it/common/widgets/app_loader.dart';
import 'package:make_it/common/widgets/custom_app_bar.dart';
import 'package:make_it/common/widgets/edit_text_field.dart';
import 'package:make_it/common/widgets/input_code_validation.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/domain/repositories/notification_repositories.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/add_notification/add_notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/logic/icon_selector/icon_selector_cubit.dart';
import 'package:make_it/flows/notifications/presentation/widgets/add_notification/confirm_add_notification.dart';
import 'package:make_it/flows/notifications/presentation/widgets/add_notification/icon_selection.dart';
import 'package:make_it/generated/locale_keys.g.dart';

@RoutePage()
class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({
    super.key,
    required this.type,
    required this.timeType,
    this.model,
  });

  final NotificationType type;
  final RecurringTimeType? timeType;
  final NotificationModel? model;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => AddNotificationCubit(
            repository: ctx.read<NotificationRepository>(),
            type: type,
            timeType: timeType,
            model: model,
          ),
        ),
        BlocProvider(
          create: (_) => IconSelectorCubit(
            icon: model?.icon,
            bgColor: model?.color,
          ),
        ),
      ],
      child: _AddNotificationView(
        isEdit: model != null,
        message: model?.message,
      ),
    );
  }
}

class _AddNotificationView extends StatefulWidget {
  const _AddNotificationView({
    required this.isEdit,
    this.message,
  });

  final bool isEdit;
  final String? message;

  @override
  State<_AddNotificationView> createState() => _AddNotificationViewState();
}

class _AddNotificationViewState extends State<_AddNotificationView> {
  late final TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController(text: widget.message);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddNotificationCubit>();
    final isOneTime = cubit.type == NotificationType.oneTime;

    return BlocListener<AddNotificationCubit, AddNotificationState>(
      listener: (context, state) {
        switch (state.status) {
          case AddNotificationStatus.loading:
            AppLoader.show(context);
          case AddNotificationStatus.failure:
            AppLoader.pop();
            Utils.showSnackBar(
              context,
              state.errorMessage,
            );
          case AddNotificationStatus.success:
            AppLoader.pop();
            context.router.pop(true);

          default:
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          text: widget.isEdit
              ? LocaleKeys.edit_notification.tr()
              : LocaleKeys.add_new_notification.tr(),
        ),
        backgroundColor: AppColors.shared.white,
        bottomNavigationBar: const ConfirmAddNotification(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          children: [
            SizedBox(height: 26.sp),
            EditTextField(
              title: LocaleKeys.message.tr(),
              hintText: LocaleKeys.enter_message.tr(),
              controller: _messageController,
              onChanged: context.read<AddNotificationCubit>().setMessage,
              maxLines: 4,
            ),
            if (isOneTime) ...[
              SizedBox(height: 24.sp),
              Text(
                LocaleKeys.type_time.tr(),
                style: AppStyles.shared.body2Medium,
              ),
              SizedBox(height: 6.sp),
              InputCodeValidation(
                onChanged: context.read<AddNotificationCubit>().updateTime,
                isCenter: false,
                stringTime: cubit.state.stringTime,
              ),
            ],
            SizedBox(height: 24.sp),
            const IconSelection(),
          ],
        ),
      ),
    );
  }
}
