import 'package:flutter/material.dart';

/// Generate height and width spaces without calling SizedBox everytime
/// in the view code
extension EmptySpace on num {
  /// Generate vertical space
  SizedBox get ph => SizedBox(height: toDouble());

  /// Generate horizontal space
  SizedBox get pw => SizedBox(width: toDouble());
}
