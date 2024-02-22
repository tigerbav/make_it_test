import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/common/utils/extensions/string.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/domain/repositories/notification_repositories.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';

part 'add_notification_state.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit({
    required this.repository,
    required this.type,
    required this.timeType,
    NotificationModel? model,
  }) : super(AddNotificationState(
          status: AddNotificationStatus.initial,
          stringTime: model?.stringTime ?? 'XX:XX',
          message: model?.message,
          icon: model?.icon,
          bgColor: model?.color,
        )) {
    id = model?.id;
  }

  final INotificationRepository repository;
  final NotificationType type;
  final RecurringTimeType? timeType;

  //for editing
  late final int? id;

  Future<void> addNotification() async {
    if ((state.stringTime.contains('X') && type == NotificationType.oneTime) ||
        state.message == null) {
      return;
    }

    emit(state.copyWith(status: AddNotificationStatus.loading));

    final result = await repository.addNotification(
      notificationType: type,
      message: state.message!,
      recurringTimeType: timeType,
      icon: state.icon,
      color: state.bgColor,
      stringTime: state.stringTime,
      id: id,
    );

    result.fold(
      (l) => emit(state.copyWith(
        status: AddNotificationStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: AddNotificationStatus.success,
      )),
    );
  }

  void setMessage(String message) {
    emit(state.copyWith(status: AddNotificationStatus.idle, message: message));
  }

  void updateTime(int index, String number) {
    if (number == '') number = 'X';
    emit(state.copyWith(
      status: AddNotificationStatus.idle,
      stringTime: state.stringTime.replaceCharAt(index, number),
    ));
  }

  void saveChanges(Color color, IconData icon) {
    emit(state.copyWith(
      status: AddNotificationStatus.idle,
      bgColor: color,
      icon: icon,
    ));
  }
}
