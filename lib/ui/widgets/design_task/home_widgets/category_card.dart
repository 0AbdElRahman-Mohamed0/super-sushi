import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';

/// Home category card
class CategoryCard extends StatelessWidget {
  /// Background image of the card
  final String imagePath;

  /// Name of the category
  final String title;

  /// Constructor of category card
  /// The [imagePath] can't be null and it is the image of the card background
  /// The [title] can't be null and it is the title of the card
  const CategoryCard({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MagicNumbers.categoryCardHeight,
      width: MagicNumbers.categoryCardHeight,
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
        borderRadius: BorderRadius.circular(
          MagicNumbers.smallBorderRadius,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
