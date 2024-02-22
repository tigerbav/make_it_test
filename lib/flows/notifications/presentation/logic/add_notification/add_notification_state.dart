part of 'add_notification_cubit.dart';

enum AddNotificationStatus { initial, idle, loading, failure, success }

class AddNotificationState extends Equatable {
  const AddNotificationState({
    required this.status,
    this.icon,
    this.bgColor,
    required this.stringTime,
    this.message,
    this.errorMessage,
  });

  final AddNotificationStatus status;
  final IconData? icon;
  final Color? bgColor;
  final String stringTime;
  final String? message;
  final String? errorMessage;

  AddNotificationState copyWith({
    required AddNotificationStatus status,
    IconData? icon,
    Color? bgColor,
    String? stringTime,
    String? message,
    String? errorMessage,
  }) {
    return AddNotificationState(
      status: status,
      icon: icon ?? this.icon,
      bgColor: bgColor ?? this.bgColor,
      stringTime: stringTime ?? this.stringTime,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        icon,
        bgColor,
        stringTime,
        message,
        errorMessage,
      ];
}
