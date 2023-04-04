import 'package:flutter/material.dart';

/// Generate colors without calling Color everytime
extension ColorData on num {
  /// Put hexa color and call .addColor to generate it
  Color get addColor => Color(toInt());
}
