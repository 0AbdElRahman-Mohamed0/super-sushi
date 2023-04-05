import 'package:easy_localization/easy_localization.dart';
import 'package:super_sushi/models/design_task/category_model.dart';
import 'package:super_sushi/models/design_task/may_love_model.dart';
import 'package:super_sushi/models/design_task/most_wanted_model.dart';
import 'package:super_sushi/models/design_task/re_order_model.dart';
import 'package:super_sushi/utils/constants/app_constants.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';

/// Categories of home
final List<CategoryModel> categories = [
  CategoryModel(
    title: tr('fast_order'),
    imagePath: '${AppConstants.designTask}/cat1'.toImage,
  ),
  CategoryModel(
    title: tr('restaurants'),
    imagePath: '${AppConstants.designTask}/cat2'.toImage,
  ),
  CategoryModel(
    title: tr('grocery'),
    imagePath: '${AppConstants.designTask}/cat3'.toImage,
  ),
];

/// Reorders of home
final List<ReOrderModel> reOrders = [
  ReOrderModel(
    title: 'مطعم هندى',
    description: 'وجبة العائلة',
    imagePath: '${AppConstants.designTask}/res1'.toImage,
  ),
  ReOrderModel(
    title: 'طلب سريع',
    description: 'متجر السلام',
    imagePath: '${AppConstants.designTask}/res2'.toImage,
  ),
];

/// Most order of home
final List<MostWantedModel> mostWanted = [
  MostWantedModel(
    title: 'مطعم هندى',
    species: ['فرايد تشيكن'],
    imagePath: '${AppConstants.designTask}/cook_door'.toImage,
    time: 45,
    deliveryPrice: 15,
    rating: 4.5,
  ),
  MostWantedModel(
    title: 'سكبترا كافيه',
    species: ['فرايد تشيكن', 'برجر'],
    imagePath: '${AppConstants.designTask}/cook_door'.toImage,
    time: 45,
    deliveryPrice: 15,
    rating: 4.5,
  ),
];

/// May love of home
final List<MayLoveModel> mayLove = [
  MayLoveModel(
    title: 'وجبة الأكيلة',
    oldPrice: 60,
    price: 30,
    imagePath: '${AppConstants.designTask}/grill'.toImage,
    resImagePath: '${AppConstants.designTask}/res1'.toImage,
    resName: 'مطعم هندي',
  ),
  MayLoveModel(
    title: 'وجبة الأكيلة',
    oldPrice: 60,
    price: 30,
    imagePath: '${AppConstants.designTask}/grill'.toImage,
    resImagePath: '${AppConstants.designTask}/res1'.toImage,
    resName: 'مطعم هندي',
  ),
  MayLoveModel(
    title: 'وجبة الأكيلة',
    oldPrice: 60,
    price: 30,
    imagePath: '${AppConstants.designTask}/grill'.toImage,
    resImagePath: '${AppConstants.designTask}/res1'.toImage,
    resName: 'مطعم هندي',
  ),
];
