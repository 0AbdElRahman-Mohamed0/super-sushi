import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_sushi/models/design_task/most_wanted_model.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/colors_palette.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Home category card
class MostWantedCard extends StatelessWidget {
  /// Most wanted restaurant
  final MostWantedModel restaurant;

  /// Constructor of category card
  /// The [restaurant] can't be null and it is the restaurant data
  const MostWantedCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MagicNumbers.mostWantedCardSize,
      width: MagicNumbers.mostWantedCardSize,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(MagicNumbers.smallBorderRadius),
            child: Image.asset(
              restaurant.imagePath,
              width: double.infinity,
              height: MagicNumbers.sliderHeight,
              fit: BoxFit.cover,
            ),
          ),
          MagicNumbers.MARGIN_SIZE_SMALL.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                MagicNumbers.MARGIN_SIZE_SOME_SMALL.ph,
                Row(
                  children: restaurant.species
                      .map(
                        (e) => Row(
                          children: [
                            const _DotShape(),
                            MagicNumbers.MARGIN_SIZE_EXTRA_VERY_SMALL.pw,
                            Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                          ],
                        ),
                      )
                      .toList(),
                ),
                MagicNumbers.MARGIN_SIZE_SMALL.ph,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      '${AppConstants.designTask}/arrive_time'.toSvg,
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_VERY_SMALL.pw,
                    Text(
                      '${restaurant.time} ${tr('min')}',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                    const _DotShape(),
                    MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                    SvgPicture.asset(
                      '${AppConstants.designTask}/delivery'.toSvg,
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_VERY_SMALL.pw,
                    Text(
                      '${restaurant.deliveryPrice} ${tr('egp')}',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                    const _DotShape(),
                    MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                    SvgPicture.asset(
                      '${AppConstants.designTask}/star'.toSvg,
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_VERY_SMALL.pw,
                    Text(
                      restaurant.rating.toString(),
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
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

class _DotShape extends StatelessWidget {
  const _DotShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MagicNumbers.PADDING_SIZE_EXTRA_SMALL,
      width: MagicNumbers.PADDING_SIZE_EXTRA_SMALL,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsPalette.geryLight,
      ),
    );
  }
}
