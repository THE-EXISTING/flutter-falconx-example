import 'package:core/app.dart';

class AppRadius {
  // AppRadius._();
  static const double zero = 0;
  // static const double hairline = 0.1;
  // static const double verySmall = 0.2;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 25;
  // static const double veryLarge = 1;
  static const double circle = double.infinity;

  static BorderRadius get circleRadius => BorderRadius.circular(circle);
  static BorderRadius get smallRadius => BorderRadius.circular(small);
  static BorderRadius get mediumRadius => BorderRadius.circular(medium);
  static BorderRadius get largeRadius => BorderRadius.circular(large);
}
