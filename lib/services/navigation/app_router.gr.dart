// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNotificationRoute.name: (routeData) {
      final args = routeData.argsAs<AddNotificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNotificationScreen(
          key: args.key,
          type: args.type,
          timeType: args.timeType,
          model: args.model,
        ),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyRoutePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    RecurringListRoute.name: (routeData) {
      final args = routeData.argsAs<RecurringListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RecurringListScreen(
          key: args.key,
          timeType: args.timeType,
          notificationCubit: args.notificationCubit,
        ),
      );
    },
    TriggerRoute.name: (routeData) {
      final args = routeData.argsAs<TriggerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TriggerScreen(
          key: args.key,
          triggerType: args.triggerType,
        ),
      );
    },
  };
}

/// generated route for
/// [AddNotificationScreen]
class AddNotificationRoute extends PageRouteInfo<AddNotificationRouteArgs> {
  AddNotificationRoute({
    Key? key,
    required NotificationType type,
    required RecurringTimeType? timeType,
    NotificationModel? model,
    List<PageRouteInfo>? children,
  }) : super(
          AddNotificationRoute.name,
          args: AddNotificationRouteArgs(
            key: key,
            type: type,
            timeType: timeType,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'AddNotificationRoute';

  static const PageInfo<AddNotificationRouteArgs> page =
      PageInfo<AddNotificationRouteArgs>(name);
}

class AddNotificationRouteArgs {
  const AddNotificationRouteArgs({
    this.key,
    required this.type,
    required this.timeType,
    this.model,
  });

  final Key? key;

  final NotificationType type;

  final RecurringTimeType? timeType;

  final NotificationModel? model;

  @override
  String toString() {
    return 'AddNotificationRouteArgs{key: $key, type: $type, timeType: $timeType, model: $model}';
  }
}

/// generated route for
/// [EmptyRoutePage]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecurringListScreen]
class RecurringListRoute extends PageRouteInfo<RecurringListRouteArgs> {
  RecurringListRoute({
    Key? key,
    required RecurringTimeType timeType,
    required NotificationCubit notificationCubit,
    List<PageRouteInfo>? children,
  }) : super(
          RecurringListRoute.name,
          args: RecurringListRouteArgs(
            key: key,
            timeType: timeType,
            notificationCubit: notificationCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'RecurringListRoute';

  static const PageInfo<RecurringListRouteArgs> page =
      PageInfo<RecurringListRouteArgs>(name);
}

class RecurringListRouteArgs {
  const RecurringListRouteArgs({
    this.key,
    required this.timeType,
    required this.notificationCubit,
  });

  final Key? key;

  final RecurringTimeType timeType;

  final NotificationCubit notificationCubit;

  @override
  String toString() {
    return 'RecurringListRouteArgs{key: $key, timeType: $timeType, notificationCubit: $notificationCubit}';
  }
}

/// generated route for
/// [TriggerScreen]
class TriggerRoute extends PageRouteInfo<TriggerRouteArgs> {
  TriggerRoute({
    Key? key,
    required TriggerType triggerType,
    List<PageRouteInfo>? children,
  }) : super(
          TriggerRoute.name,
          args: TriggerRouteArgs(
            key: key,
            triggerType: triggerType,
          ),
          initialChildren: children,
        );

  static const String name = 'TriggerRoute';

  static const PageInfo<TriggerRouteArgs> page =
      PageInfo<TriggerRouteArgs>(name);
}

class TriggerRouteArgs {
  const TriggerRouteArgs({
    this.key,
    required this.triggerType,
  });

  final Key? key;

  final TriggerType triggerType;

  @override
  String toString() {
    return 'TriggerRouteArgs{key: $key, triggerType: $triggerType}';
  }
}
