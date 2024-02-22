part of 'notification_cubit.dart';

enum NotificationStatus { initial, idle, loading, success, failure, refresh }

class NotificationState extends Equatable {
  const NotificationState({
    required this.status,
    required this.currentType,
    required List<NotificationModel> models,
    this.messageError,
  }) : _models = models;

  final NotificationStatus status;
  final NotificationType currentType;
  final List<NotificationModel> _models;
  final String? messageError;

  bool get isLoading => status == NotificationStatus.loading;

  List<NotificationModel> get modelsByType {
    return _models.where((e) => e.notificationType == currentType).toList();
  }

  List<NotificationModel> modelsByRecurringTimeType(
    RecurringTimeType timeType,
  ) {
    return _models.where((e) => e.recurringTimeType == timeType).toList();
  }

  NotificationState copyWith({
    required NotificationStatus status,
    NotificationType? currentType,
    List<NotificationModel>? models,
    String? messageError,
  }) {
    return NotificationState(
      status: status,
      currentType: currentType ?? this.currentType,
      models: models ?? _models,
      messageError: messageError ?? this.messageError,
    );
  }

  @override
  List<Object?> get props => [status, currentType, _models, messageError];
}
