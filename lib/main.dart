import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:super_sushi/providers/app_provider.dart';
import 'package:super_sushi/providers/repos_provider.dart';
import 'package:super_sushi/services/db_services/db_handler.dart';
import 'package:super_sushi/services/notifications/notification_handler.dart';
import 'package:super_sushi/ui/screens/start_screens/splash_screen.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/theme/app_theme.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      await DBHandler().deleteDatabaseTask();
      NotificationHandler().showNotification(
          title: 'New data', body: 'Enter the app to get new data');
    } catch (err) {
      Logger().e(err
          .toString()); // Logger flutter package, prints error on the debug console
      throw Exception(err);
    }

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/languages',
      fallbackLocale: const Locale('ar'),
      useOnlyLangCode: true,
      startLocale: const Locale('ar'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(
            create: (_) => AppProvider(),
          ),
          ChangeNotifierProvider<ReposProvider>(
            create: (_) => ReposProvider(),
          ),
          ChangeNotifierProvider<DBHandler>(
            create: (_) => DBHandler(),
          ),
        ],
        child: const Main(),
      ),
    ),
  );
}

/// Material widget class of the app
/// This widget is the root of your application.
class Main extends StatefulWidget {
  /// Constructor of the main class
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    NotificationHandler().initNotification();
    NotificationHandler().isAndroidPermissionGranted();
    NotificationHandler().requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.getTheme(isDark: context.read<AppProvider>().darkTheme),
      themeMode: context.read<AppProvider>().darkTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
    );
  }
}
