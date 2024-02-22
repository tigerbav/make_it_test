import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:make_it/app/presentation/logic/app_cubit.dart';
import 'package:make_it/app/presentation/screens/app.dart';
import 'package:make_it/flows/notifications/data/datasources/notification_datasource.dart';
import 'package:make_it/flows/notifications/domain/repositories/notification_repositories.dart';
import 'package:make_it/services/notification_provider/notification_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationProvider.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/locale',
      fallbackLocale: const Locale('en', 'US'),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: RepositoryProvider(
          create: (_) => NotificationRepository(NotificationDataSource()),
          child: BlocProvider(
            create: (_) => AppCubit(),
            child: const App(),
          ),
        ),
      ),
    ),
  );
}
