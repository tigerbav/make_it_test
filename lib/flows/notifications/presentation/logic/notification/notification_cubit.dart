import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/domain/repositories/notification_repositories.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._repository)
      : super(const NotificationState(
          status: NotificationStatus.initial,
          currentType: NotificationType.oneTime,
          models: [],
        )) {
    loadNotifications();
  }

  final INotificationRepository _repository;

  Future<void> loadNotifications({bool refresh = false}) async {
    emit(state.copyWith(
      status: refresh ? NotificationStatus.refresh : NotificationStatus.loading,
    ));

    final result = await _repository.getNotifications();
    result.fold(
      (l) => emit(state.copyWith(
        status: NotificationStatus.failure,
        messageError: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: NotificationStatus.success,
        models: r,
      )),
    );
  }

  void setType(NotificationType type) {
    emit(state.copyWith(
      status: NotificationStatus.idle,
      currentType: type,
    ));
  }

  Future<void> removeNotification(NotificationModel model) async {
    final result = await _repository.deleteNotifications(model.id);
    if (result.isLeft) {
      emit(state.copyWith(
        status: NotificationStatus.failure,
        messageError: result.left.errorMessage,
      ));
    }

    final newList = List<NotificationModel>.from(state._models);
    newList.remove(model);

    emit(state.copyWith(
      status: NotificationStatus.idle,
      models: newList,
    ));
  }
}
