import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:make_it/flows/notifications/data/datasources/notification_datasource.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/services/network/failures/failure.dart';

abstract class INotificationRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
  Future<Either<Failure, void>> deleteNotifications(int id);
  Future<Either<Failure, void>> addNotification({
    required String message,
    required String stringTime,
    required RecurringTimeType? recurringTimeType,
    required IconData? icon,
    required Color? color,
    required NotificationType notificationType,
    required int? id,
  });
}

class NotificationRepository extends INotificationRepository {
  NotificationRepository(this._dataSource);
  final INotificationDataSource _dataSource;

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    try {
      final result = await _dataSource.getNotifications();
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotifications(int id) async {
    try {
      await _dataSource.deleteNotifications(id);
      return const Right({});
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }

  @override
  Future<Either<Failure, void>> addNotification({
    required String message,
    required String stringTime,
    required RecurringTimeType? recurringTimeType,
    required IconData? icon,
    required Color? color,
    required NotificationType notificationType,
    required int? id,
  }) async {
    try {
      await _dataSource.addNotification(
        message: message,
        stringTime: stringTime,
        recurringTimeType: recurringTimeType,
        icon: icon,
        color: color,
        notificationType: notificationType,
        id: id,
      );

      return const Right({});
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }
}
