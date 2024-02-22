import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:make_it/flows/login/presentation/screens/login_screen.dart';
import 'package:make_it/flows/notifications/data/models/notification_model.dart';
import 'package:make_it/flows/notifications/presentation/enums/notification_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/recurring_time_type.dart';
import 'package:make_it/flows/notifications/presentation/enums/trigger_type.dart';
import 'package:make_it/flows/notifications/presentation/logic/notification/notification_cubit.dart';
import 'package:make_it/flows/notifications/presentation/screens/add_notification_screen.dart';
import 'package:make_it/flows/notifications/presentation/screens/notification_screen.dart';
import 'package:make_it/flows/notifications/presentation/screens/recurring_list_screen.dart';
import 'package:make_it/flows/notifications/presentation/screens/trigger_screen.dart';
import 'package:make_it/services/navigation/empty_route_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter(GlobalKey<NavigatorState> navigatorKey)
      : super(navigatorKey: navigatorKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: LoginRoute.page),
        AutoRoute(
          page: EmptyRoute.page,
          children: [
            AutoRoute(initial: true, page: NotificationRoute.page),
            AutoRoute(page: AddNotificationRoute.page),
            AutoRoute(page: RecurringListRoute.page),
            AutoRoute(page: TriggerRoute.page),
          ],
        ),
      ];
}
