import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/common/utils/extensions/string.dart';
import 'package:make_it/generated/locale_keys.g.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: LoginStatus.initial));

  void updateTime(int index, String number) {
    if (number == '') number = 'X';
    emit(state.copyWith(
      status: LoginStatus.idle,
      stringTime: state.stringTime.replaceCharAt(index, number),
    ));
  }

  void checkTime() {
    final nowTimeString = DateFormat('HH:mm').format(DateTime.now());
    if (nowTimeString == state.stringTime) {
      emit(state.copyWith(status: LoginStatus.success));
      return;
    }

    emit(state.copyWith(
      status: LoginStatus.failure,
      errorMessage: LocaleKeys.the_time_is_wrong.tr(),
    ));
  }
}
