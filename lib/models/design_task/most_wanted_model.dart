/// Each category data model
class MostWantedModel {
  /// Name of the restaurant
  String title;

  /// Species of the restaurant
  List<String> species;

  /// Delivery duration
  int time;

  /// Delivery price
  int deliveryPrice;

  /// Rating of the restaurant
  num rating;

  /// Image path of the rastaurant
  String imagePath;

  /// Constructor to implement data
  MostWantedModel({
    required this.title,
    required this.species,
    required this.time,
    required this.deliveryPrice,
    required this.rating,
    required this.imagePath,
  });
}
