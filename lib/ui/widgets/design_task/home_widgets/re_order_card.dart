import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Home category card
class ReOrderCard extends StatelessWidget {
  /// Path of image of the restaurant
  final String imagePath;

  /// Name of the restaurant
  final String title;

  /// Description of the card
  final String description;

  /// Constructor of category card
  /// The [imagePath] can't be null and it is the image of the restaurant
  /// The [title] can't be null and it is the name of the restaurant
  /// The [description] can't be null and it is the description
  /// of the restaurant
  const ReOrderCard({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MagicNumbers.reOrderCardHeight,
      width: MediaQuery.of(context).size.width /
          MagicNumbers.MARGIN_SIZE_EXTRA_VERY_SMALL,
      padding: const EdgeInsets.symmetric(
        horizontal: MagicNumbers.PADDING_SIZE_SMALL,
        vertical: MagicNumbers.PADDING_SIZE_DEFAULT,
      ),
      margin: EdgeInsets.only(
        left: context.locale.languageCode == 'en'
            ? 0
            : MagicNumbers.MARGIN_SIZE_SMALL,
        right: context.locale.languageCode == 'en'
            ? MagicNumbers.MARGIN_SIZE_SMALL
            : 0,
      ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(MagicNumbers.smallBorderRadius),
                child: Image.asset(imagePath),
              ),
              MagicNumbers.MARGIN_SIZE_SOME_SMALL.pw,
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.ph,
                  Text(
                    description,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ],
          ),
          MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset('re_order'.toSvg),
              MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
              Text(
                tr('re_order'),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: MagicNumbers.FONT_SIZE_SMALL,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
