import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:super_sushi/ui/widgets/base_widgets/my_text_form_field.dart';
import 'package:super_sushi/ui/widgets/dev_task/repo_card.dart';
import 'package:super_sushi/utils/constants/magic_numbers.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';
import 'package:super_sushi/utils/extensions/empty_space.dart';

/// Dev task repos screen
class ReposScreen extends StatefulWidget {
  /// Constructor of repos screen
  const ReposScreen({Key? key}) : super(key: key);

  @override
  State<ReposScreen> createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
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
          horizontal: MagicNumbers.PADDING_SIZE_DEFAULT,
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
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        'forward_arrow'.toSvg,
                        matchTextDirection: true,
                      ),
                    ),
                    MagicNumbers.MARGIN_SIZE_DEFAULT.pw,
                    Expanded(
                      child: MyTextFormField(
                        onChanged: (v) {},
                        prefixIcon: SvgPicture.asset(
                          'search'.toSvg,
                        ),
                        hintText: tr('search_repo'),
                      ),
                    ),
                  ],
                ),
                MagicNumbers.MARGIN_SIZE_LARGE.ph,
                const RepoCard(),
                const RepoCard(),
                const RepoCard(),
                const RepoCard(),
                const RepoCard(),
                const RepoCard(),
                const RepoCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
