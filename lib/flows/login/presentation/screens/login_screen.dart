import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/app/presentation/logic/app_cubit.dart';
import 'package:make_it/common/app_colors.dart';
import 'package:make_it/common/app_styles.dart';
import 'package:make_it/common/utils/utils.dart';
import 'package:make_it/common/widgets/custom_app_bar.dart';
import 'package:make_it/flows/login/presentation/logic/login_cubit.dart';
import 'package:make_it/flows/login/presentation/widgets/confirm_button.dart';
import 'package:make_it/flows/login/presentation/widgets/current_time.dart';
import 'package:make_it/common/widgets/input_code_validation.dart';
import 'package:make_it/generated/locale_keys.g.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const _LoginScreenView(),
    );
  }
}

class _LoginScreenView extends StatelessWidget {
  const _LoginScreenView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case LoginStatus.success:
            context.read<AppCubit>().successAuth();
          case LoginStatus.failure:
            Utils.showSnackBar(context, state.errorMessage);
          default:
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(text: LocaleKeys.log_in.tr()),
        backgroundColor: AppColors.shared.white,
        bottomNavigationBar: const ConfirmButton(),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 72.sp),
              Text(
                LocaleKeys.log_in.tr(),
                style: AppStyles.shared.h2Bold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.sp),
              Text(
                LocaleKeys.enter_current_time_format.tr(),
                style: AppStyles.shared.body1Regular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 42.sp),
              const CurrentTime(),
              SizedBox(height: 42.sp),
              InputCodeValidation(
                onChanged: context.read<LoginCubit>().updateTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
