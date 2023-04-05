import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Slider of home screen
class SliderWidget extends StatefulWidget {
  /// No data needed
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int indicatorIndex = 0;
  final List<String> _sliderImages = [
    '${AppConstants.designTask}/slider'.toImage,
    '${AppConstants.designTask}/slider'.toImage,
    '${AppConstants.designTask}/slider'.toImage,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            height: MagicNumbers.sliderHeight,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason) {
              setState(() {
                indicatorIndex = index;
              });
            },
          ),
          items: _sliderImages
              .map(
                (image) => Container(
                  height: MagicNumbers.sliderHeight,
                  margin: const EdgeInsets.symmetric(
                    horizontal: MagicNumbers.MARGIN_SIZE_EXTRA_SMALL,
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      MagicNumbers.largeBorderRadius,
                    ),
                    child: Image.asset(
                      image,
                      height: MagicNumbers.sliderHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        MagicNumbers.PADDING_SIZE_SMALL.ph,
        DotsIndicator(
          dotsCount: _sliderImages.length,
          position: indicatorIndex.toDouble(),
          decorator: DotsDecorator(
            activeSize: const Size(20, 6),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MagicNumbers.largeBorderRadius,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MagicNumbers.largeBorderRadius,
              ),
            ),
            size: const Size(20, 6),
            spacing: EdgeInsets.zero,
            color: Theme.of(context).backgroundColor,
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
