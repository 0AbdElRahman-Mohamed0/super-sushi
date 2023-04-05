import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
