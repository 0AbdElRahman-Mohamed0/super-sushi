/// Each category data model
class MayLoveModel {
  /// Name of the meal
  String title;

  /// Name of the restaurant
  String resName;

  /// New price
  int price;

  /// Old price
  int oldPrice;

  /// Image path of the meal
  String imagePath;

  /// Image path of the restaurant
  String resImagePath;

  /// Constructor to implement data
  MayLoveModel({
    required this.title,
    required this.resName,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
    required this.resImagePath,
  });
}
