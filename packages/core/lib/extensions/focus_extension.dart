import 'package:core/app.dart';

extension SubmitAction on RawKeyEvent {
  bool get hasSubmitIntent =>
      this is RawKeyDownEvent &&
      (logicalKey == LogicalKeyboardKey.select ||
          logicalKey == LogicalKeyboardKey.enter);
}
