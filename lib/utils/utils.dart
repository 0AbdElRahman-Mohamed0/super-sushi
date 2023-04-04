import 'package:flutter/material.dart';

class Utils {
  static double getWidth(BuildContext context, double width) {
    return (MediaQuery.of(context).size.width * width) / 375;
  }

  static double getHeight(BuildContext context, double height) {
    return (MediaQuery.of(context).size.height * height) / 812;
  }
}
