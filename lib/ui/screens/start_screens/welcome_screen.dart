import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/ui/widgets/base_widgets/task_button.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Welcome screen to choose between tasks
class WelcomeScreen extends StatelessWidget {
  /// Welcome screen constructor
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('select_task'),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: MagicNumbers.FONT_SIZE_LARGE,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.setLocale(
                      Locale(
                        context.locale.languageCode == 'en' ? 'ar' : 'en',
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${context.locale.languageCode == 'en' ? 'إضغط للتغيير إلى' : 'Press to change to'} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        TextSpan(
                          text: context.locale.languageCode == 'en'
                              ? 'اللغة العربية'
                              : 'English language',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_LARGE,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
            Row(
              children: [
                const Expanded(child: TaskButton()),
                MagicNumbers.MARGIN_SIZE_LARGE.pw,
                const Expanded(
                  child: TaskButton(
                    isGithub: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
