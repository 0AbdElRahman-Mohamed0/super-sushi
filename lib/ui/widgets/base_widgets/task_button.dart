import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/services/db_services/db_handler.dart';
import 'package:super_sushi/ui/screens/design_task/home_screen/home_screen.dart';
import 'package:super_sushi/ui/screens/dev_task/repos_screen.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Task button to call on welcome screen
class TaskButton extends StatefulWidget {
  /// Boolean value to check is that task of github or not
  final bool isGithub;

  /// Constructor of task button
  /// The [isGithub] to check witch button style it will be
  /// and it can be null and it will use default value of false.
  const TaskButton({Key? key, this.isGithub = false}) : super(key: key);

  @override
  State<TaskButton> createState() => _TaskButtonState();
}

class _TaskButtonState extends State<TaskButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.isGithub) {
          await context.read<DBHandler>().initDB();
          if (!mounted) return;
          Navigator.push<ReposScreen>(
            context,
            CupertinoPageRoute(
              builder: (_) => const ReposScreen(),
            ),
          );
        } else {
          Navigator.push<HomeScreen>(
            context,
            CupertinoPageRoute(
              builder: (_) => const HomeScreen(),
            ),
          );
        }
      },
      child: Container(
        height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
        decoration: BoxDecoration(
          color: widget.isGithub
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(MagicNumbers.smallBorderRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(MagicNumbers.smallBorderRadius),
              child: Image.asset(
                widget.isGithub ? 'github'.toImage : 'design'.toImage,
                height: MagicNumbers.ICON_SIZE_LARGE,
                width: MagicNumbers.ICON_SIZE_LARGE,
                fit: BoxFit.cover,
              ),
            ),
            MagicNumbers.MARGIN_SIZE_DEFAULT.pw,
            Text(
              widget.isGithub ? tr('github') : tr('design'),
              style: widget.isGithub
                  ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_LARGE,
                        fontWeight: FontWeight.w700,
                      )
                  : Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_LARGE,
                        fontWeight: FontWeight.w700,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
