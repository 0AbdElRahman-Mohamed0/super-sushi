import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Repo card design
class RepoCard extends StatelessWidget {
  /// Constructor of repo card
  const RepoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: MagicNumbers.PADDING_SIZE_SMALL,
        vertical: MagicNumbers.PADDING_SIZE_DEFAULT,
      ),
      margin: const EdgeInsets.only(bottom: MagicNumbers.MARGIN_SIZE_SMALL),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).backgroundColor,
        ),
        borderRadius: BorderRadius.circular(
          MagicNumbers.smallBorderRadius,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(MagicNumbers.smallBorderRadius),
                child: Image.asset(
                  '${AppConstants.designTask}/res1'.toImage,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              MagicNumbers.MARGIN_SIZE_SOME_SMALL.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'username',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.ph,
                  Text(
                    'title',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.ph,
                  Text(
                    'description',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
