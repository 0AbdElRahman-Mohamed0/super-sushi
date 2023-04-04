/// Get assets path without writing ti everytime
extension AssetPath on String {
  /// Get image path
  String get toImage => 'assets/images/$this.png';

  /// Get svg path
  String get toSvg => 'assets/svg/$this.svg';
}
