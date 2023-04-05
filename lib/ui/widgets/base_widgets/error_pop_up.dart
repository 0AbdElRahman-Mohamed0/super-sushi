import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart' hide FontWeight;
import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

class ErrorPopUp extends StatelessWidget {
  final String message;
  final String? title;
  final String? buttonText;
  final VoidCallback? onClick;

  const ErrorPopUp(
      {Key? key,
      required this.message,
      this.title,
      this.buttonText,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(tr('error')),
      content: Column(
        children: <Widget>[
          MagicNumbers.MARGIN_SIZE_EXTRA_LARGE.ph,
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w400,
                ),
          ),
          MagicNumbers.MARGIN_SIZE_EXTRA_LARGE.ph,
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.MARGIN_SIZE_EXTRA_Some_LARGE,
                vertical: MagicNumbers.MARGIN_SIZE_SMALL,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.16),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ]),
              child: Text(
                tr('ok'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_SMALL.ph,
        ],
      ),
    );
  }
}
