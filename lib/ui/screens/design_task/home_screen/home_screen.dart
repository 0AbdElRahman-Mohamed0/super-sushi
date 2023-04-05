import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:super_sushi/ui/screens/design_task/home_screen/data/home_static_data.dart';
import 'package:super_sushi/ui/widgets/base_widgets/my_text_form_field.dart';
import 'package:super_sushi/ui/widgets/design_task/home_widgets/category_card.dart';
import 'package:super_sushi/ui/widgets/design_task/home_widgets/may_love_card.dart';
import 'package:super_sushi/ui/widgets/design_task/home_widgets/most_wanted_card.dart';
import 'package:super_sushi/ui/widgets/design_task/home_widgets/re_order_card.dart';
import 'package:super_sushi/ui/widgets/design_task/home_widgets/slider_widget.dart';
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
        padding: const EdgeInsets.symmetric(
          vertical: MagicNumbers.PADDING_SIZE_SUPER_EXTRA_LARGE,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        horizontal: MagicNumbers.PADDING_SIZE_SMALL,
                      ),
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
                const SliderWidget(),
                MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
                Text(
                  tr('categories'),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_EXTRA_HIGH_LARGE,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
          SizedBox(
            height: MagicNumbers.categoryCardHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
              ),
              children: categories
                  .map(
                    (category) => CategoryCard(
                      title: category.title,
                      imagePath: category.imagePath,
                    ),
                  )
                  .toList(),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_EXTRA_Some_LARGE.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Text(
              tr('re_order'),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: MagicNumbers.FONT_SIZE_EXTRA_HIGH_LARGE,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
          SizedBox(
            height: MagicNumbers.reOrderCardHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
              ),
              children: reOrders
                  .map(
                    (order) => ReOrderCard(
                      title: order.title,
                      description: order.description,
                      imagePath: order.imagePath,
                    ),
                  )
                  .toList(),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_EXTRA_Some_LARGE.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('most_wanted'),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: MagicNumbers.FONT_SIZE_EXTRA_HIGH_LARGE,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      tr('all'),
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: MagicNumbers.FONT_SIZE_EXTRA_HIGH_LARGE,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    MagicNumbers.MARGIN_SIZE_EXTRA_SMALL.pw,
                    SvgPicture.asset('forward_arrow'.toSvg),
                  ],
                ),
              ],
            ),
          ),
          MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
          SizedBox(
            height: MagicNumbers.mostWantedCardSize,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
              ),
              children: mostWanted
                  .map(
                    (res) => MostWantedCard(restaurant: res),
                  )
                  .toList(),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_EXTRA_Some_LARGE.ph,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
            ),
            child: Text(
              tr('may_love'),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: MagicNumbers.FONT_SIZE_EXTRA_HIGH_LARGE,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          MagicNumbers.MARGIN_SIZE_DEFAULT.ph,
          SizedBox(
            height: MagicNumbers.mayLoveCardHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
              ),
              children: mayLove
                  .map(
                    (meal) => MayLoveCard(meal: meal),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
