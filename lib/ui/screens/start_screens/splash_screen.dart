import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/ui/screens/start_screens/welcome_screen.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';

/// Splash screen
class SplashScreen extends StatefulWidget {
  /// Splash constructor
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      duration: MagicNumbers.durationOfSplash,
      animationDuration: const Duration(seconds: 3),
      splashTransition: SplashTransition.fadeTransition,
      splash: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('sushi'.toImage),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: MagicNumbers.APP_NAME,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
      nextScreen: const WelcomeScreen(),
    );
  }
}
