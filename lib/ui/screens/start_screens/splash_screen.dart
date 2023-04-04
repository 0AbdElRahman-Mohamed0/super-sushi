import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/ui/screens/start_screens/welcome_screen.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/colors_palette.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';

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
      backgroundColor: ColorsPalette.secondPrimaryColor,
      splashIconSize: MagicNumbers.splashIconSize,
      duration: MagicNumbers.durationOfSplash,
      animationDuration: const Duration(seconds: 3),
      splashTransition: SplashTransition.scaleTransition,
      splash: Center(
        child: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: MagicNumbers.APP_NAME,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      nextScreen: const WelcomeScreen(),
    );
  }
}
