import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/common/widgets/main_button.dart';
import 'package:make_it/flows/login/presentation/logic/login_cubit.dart';
import 'package:make_it/generated/locale_keys.g.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (p, c) => p.containX != c.containX,
      builder: (context, state) {
        return MainButton(
          text: LocaleKeys.confirm.tr(),
          onPressed:
              state.containX ? null : context.read<LoginCubit>().checkTime,
        );
      },
    );
  }
}
