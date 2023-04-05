import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';
import 'package:url_launcher/url_launcher.dart';

/// Select between show owner url or show the repo url
class SelectActionPopUp extends StatefulWidget {
  /// Repo owner url
  final String ownerUrl;

  /// Repo url
  final String repoUrl;

  /// Constructor
  /// The [ownerUrl] && [repoUrl] to get launcher urls
  /// and it can't be null.
  const SelectActionPopUp({
    Key? key,
    required this.ownerUrl,
    required this.repoUrl,
  }) : super(key: key);

  @override
  State<SelectActionPopUp> createState() => _SelectActionPopUpState();
}

class _SelectActionPopUpState extends State<SelectActionPopUp> {
  _launch({bool isOwner = false}) async {
    Navigator.pop(context);
    await launchUrl(Uri.parse(isOwner ? widget.ownerUrl : widget.repoUrl));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MagicNumbers.MARGIN_SIZE_EXTRA_LARGE.ph,
          Text(
            tr('which_action'),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _launch(isOwner: true),
                  child: Container(
                    height: MagicNumbers.PADDING_SIZE_VERTICAL_SOME_EXTRA_LARGE,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tr('owner'),
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                ),
              ),
              MagicNumbers.MARGIN_SIZE_SMALL.pw,
              Expanded(
                child: GestureDetector(
                  onTap: _launch,
                  child: Container(
                    height: MagicNumbers.PADDING_SIZE_VERTICAL_SOME_EXTRA_LARGE,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tr('repo'),
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          MagicNumbers.MARGIN_SIZE_EXTRA_LARGE.ph,
        ],
      ),
    );
  }
}
