import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/providers/app_provider.dart';
import 'package:super_sushi/providers/repos_provider.dart';
import 'package:super_sushi/services/db_services/db_handler.dart';
import 'package:super_sushi/ui/screens/start_screens/splash_screen.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
class Main extends StatelessWidget {
  /// Constructor of the main class
  const Main({super.key});

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
