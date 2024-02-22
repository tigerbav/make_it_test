import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.id,
    required this.notificationType,
    required this.recurringTimeType,
    required this.stringTime,
    required this.message,
    this.icon,
    this.color,
  });

  final int id;
  final NotificationType notificationType;
  final RecurringTimeType? recurringTimeType;
  final String stringTime;
  final String message;
  final IconData? icon;
  final Color? color;

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      notificationType: NotificationTypeEx.fromApi(map['notificationType'])!,
      recurringTimeType: RecurringTimeTypeEx.fromApi(map['recurringTimeType']),
      stringTime: map['stringTime'] as String,
      message: map['message'] as String,
      icon: map['icon'] == 0
          ? null
          : IconData(map['icon'], fontFamily: 'MaterialIcons'),
      color: map['color'] == '' ? null : Color(map['color']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'notificationType': notificationType.code,
      'recurringTimeType': recurringTimeType?.code ?? 0,
      'stringTime': stringTime,
      'message': message,
      'icon': icon?.codePoint ?? 0,
      'color': color?.value ?? '',
    };
  }

  @override
  List<Object?> get props => [
        id,
        notificationType,
        recurringTimeType,
        stringTime,
        message,
        icon,
        color,
      ];
}
