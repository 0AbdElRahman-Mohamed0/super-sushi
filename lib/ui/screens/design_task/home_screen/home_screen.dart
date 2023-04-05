import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:super_sushi/ui/widgets/base_widgets/my_text_form_field.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Design task home screen
class HomeScreen extends StatefulWidget {
  /// Constructor of home screen
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _position;
  String? _currentLocation;
  List<Placemark>? _placeMarks;
  int indicatorIndex = 0;
  List<String> _sliderImages = [
    'slider'.toImage,
    'slider'.toImage,
    'slider'.toImage,
  ];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      setState(() {
        _position = null;
        _placeMarks = null;
        _currentLocation = null;
      });
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        _placeMarks = await placemarkFromCoordinates(
          _position?.latitude.toDouble() ?? 0,
          _position?.longitude.toDouble() ?? 0,
          localeIdentifier: context.locale.languageCode,
        );
        setState(() {
          _currentLocation =
              '${_placeMarks?.first.subLocality}, ${_placeMarks?.first.street}';
        });
      } else {
        setState(() {
          _currentLocation = tr('location_failed');
        });
      }
    } catch (e) {
      setState(() {
        _currentLocation = tr('location_failed');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MagicNumbers.MARGIN_SIZE_LARGE.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('location'.toSvg),
                        MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                        if (_placeMarks == null)
                          const CupertinoActivityIndicator()
                        else
                          Text(
                            _currentLocation ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                      ],
                    ),
                    InkWell(
                      onTap: _getLocation,
                      child: Text(
                        tr('change'),
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: MagicNumbers.FONT_SIZE_DEFAULT,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                  ],
                ),
                MagicNumbers.MARGIN_SIZE_LARGE.ph,
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        onChanged: (v) {},
                        prefixIcon: SvgPicture.asset('search'.toSvg),
                        hintText: tr('search_hint'),
                      ),
                    ),
                    MagicNumbers.MARGIN_SIZE_SMALL.pw,
                    Container(
                      height: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
                      padding: const EdgeInsets.symmetric(
                          horizontal: MagicNumbers.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          MagicNumbers.extraSmallBorderRadius,
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset('cart'.toSvg),
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Text(
                                  '50',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize:
                                            MagicNumbers.FONT_SIZE_EXTRA_SMALL,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MagicNumbers.MARGIN_SIZE_EXTRA_LARGE,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            '300 ${tr('egp')}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: MagicNumbers.FONT_SIZE_SMALL,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MagicNumbers.MARGIN_SIZE_LARGE.ph,
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
                const SizedBox(height: 6),
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
            ),
          ),
        ],
      ),
    );
  }
}
