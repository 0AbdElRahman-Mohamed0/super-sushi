import 'package:easy_localization/easy_localization.dart';
import 'package:super_sushi/models/design_task/category_model.dart';
import 'package:super_sushi/models/design_task/re_order_model.dart';
import 'package:super_sushi/utils/extensions/asset_path.dart';

/// Categories of home
final List<CategoryModel> categories = [
  CategoryModel(
    title: tr('fast_order'),
    imagePath: 'cat1'.toImage,
  ),
  CategoryModel(
    title: tr('restaurants'),
    imagePath: 'cat2'.toImage,
  ),
  CategoryModel(
    title: tr('grocery'),
    imagePath: 'cat3'.toImage,
  ),
];

/// Reorders of home
final List<ReOrderModel> reOrders = [
  ReOrderModel(
    title: 'مطعم هندى',
    description: 'وجبة العائلة',
    imagePath: 'res1'.toImage,
  ),
  ReOrderModel(
    title: 'طلب سريع',
    description: 'متجر السلام',
    imagePath: 'res2'.toImage,
  ),
];
