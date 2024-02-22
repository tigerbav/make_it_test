import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:make_it/common/app_constants.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/services/network/failures/failure.dart';
import 'package:make_it/services/notification_provider/notification_provider.dart';

abstract class INotificationDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<void> deleteNotifications(int id);
  Future<void> addNotification({
    required String message,
    required String stringTime,
    required RecurringTimeType? recurringTimeType,
    required IconData? icon,
    required Color? color,
    required NotificationType notificationType,
    required int? id,
  });
}

class NotificationDataSource extends INotificationDataSource {
  NotificationDataSource() {
    _init();
  }

  late final FirebaseFirestore _db;

  _init() {
    _db = FirebaseFirestore.instance;
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final list = <NotificationModel>[];

    await _db.collection(C.notification).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          list.add(NotificationModel.fromMap(docSnapshot.data()));
        }
      },
    ).onError((e, stackTrace) => throw Failure.from(e, stackTrace));

    final currTime = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(currTime);

    final newList = <NotificationModel>[];
    for (var e in list) {
      final time = DateTime.tryParse('${formattedDate}T${e.stringTime}');
      if ((time != null && time.compareTo(currTime) > 0) ||
          e.recurringTimeType != null) {
        newList.add(e);
      } else {
        deleteNotifications(e.id);
      }
    }
    return newList;
  }

  @override
  Future<void> deleteNotifications(int id) async {
    _db.collection(C.notification).doc(id.toString()).delete().then((_) {
      try {
        NotificationProvider.cancel(id);
      } catch (e, stackTrace) {
        throw Failure.from(e, stackTrace);
      }
    }).onError((e, stackTrace) => throw Failure.from(e, stackTrace));
  }

  @override
  Future<void> addNotification({
    required String message,
    required String stringTime,
    required RecurringTimeType? recurringTimeType,
    required IconData? icon,
    required Color? color,
    required NotificationType notificationType,
    required int? id,
  }) async {
    late final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    late final dt = DateTime.parse("${formattedDate}T$stringTime");
    late final formattedTime = DateFormat('HH:mm').format(dt);

    final model = NotificationModel(
      id: id ?? Random().nextInt(10000),
      notificationType: notificationType,
      recurringTimeType: recurringTimeType,
      stringTime: recurringTimeType?.title ?? formattedTime,
      icon: icon,
      color: color,
      message: message,
    );

    await _db
        .collection(C.notification)
        .doc(model.id.toString())
        .set(model.toMap())
        .then((value) {
      if (id != null) NotificationProvider.cancel(id);
      if (recurringTimeType != null) {
        NotificationProvider.showPeriodicNotifications(
          body: message,
          id: model.id,
        );
      } else {
        NotificationProvider.showScheduleNotification(
          id: model.id,
          body: message,
          duration: dt.difference(DateTime.now()),
        );
      }
    }).onError((e, stackTrace) => throw Failure.from(e, stackTrace));
  }
}
