import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_sushi/models/design_task/may_love_model.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Home may love card
class MayLoveCard extends StatelessWidget {
  /// May love
  final MayLoveModel meal;

  /// Constructor of may love card
  /// The [meal] can't be null and it is the restaurant data
  const MayLoveCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MagicNumbers.mayLoveCardHeight,
      width: MagicNumbers.mayLoveCardWidth,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(MagicNumbers.smallBorderRadius),
                child: Image.asset(
                  meal.imagePath,
                  width: double.infinity,
                  height: MagicNumbers.sliderHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(
                  MagicNumbers.MARGIN_SIZE_SMALL,
                ),
                height: MagicNumbers.cartSizeBackground,
                width: MagicNumbers.cartSizeBackground,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(MagicNumbers.cartBackgroundOpacity),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  '${AppConstants.designTask}/cart'.toSvg,
                  height: MagicNumbers.ICON_SIZE_SMALL,
                  width: MagicNumbers.ICON_SIZE_SMALL,
                ),
              ),
            ],
          ),
          MagicNumbers.MARGIN_SIZE_SMALL.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                MagicNumbers.MARGIN_SIZE_SOME_SMALL.ph,
                Row(
                  children: [
                    Text(
                      '${meal.price} ${tr('egp')}',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    MagicNumbers.MARGIN_SIZE_SMALL.pw,
                    Text(
                      '${meal.oldPrice} ${tr('egp')}',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                    ),
                  ],
                ),
                MagicNumbers.MARGIN_SIZE_SMALL.ph,
                Row(
                  children: [
                    Container(
                      height: MagicNumbers.cartSizeBackground,
                      width: MagicNumbers.cartSizeBackground,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(meal.resImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    MagicNumbers.MARGIN_SIZE_SOME_SMALL.pw,
                    Text(
                      meal.resName,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
