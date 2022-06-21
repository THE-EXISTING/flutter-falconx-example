import 'package:core/app.dart';

class AppSize {
  static const icon = _IconSize();
  static const bigIcon = _BigIconSize();
  static const button = _ButtonSize();
  static const list = _ListSize();
  static const double gapSize = 8;
  static const double symmetricHorizontal = 16;
  static const double symmetricVertical = 8;
  static const double toolbar = kToolbarHeight;
  static const double toolbarExtra = kToolbarHeight + 8;
  static const double tabBar = 48;

  static EdgeInsets get symmetricHorizontalInsets =>
      const EdgeInsets.symmetric(horizontal: symmetricHorizontal);

  static EdgeInsets get symmetricInsets => const EdgeInsets.symmetric(
        horizontal: symmetricHorizontal,
        vertical: symmetricVertical,
      );

  static EdgeInsets get allInsets => const EdgeInsets.all(symmetricHorizontal);

  static EdgeInsets get listVerticalPadding => const EdgeInsets.only(
        top: 8,
        bottom: 40,
        left: 16,
        right: 16,
      );

  static Widget get listSeparator => const Space.box(gapSize);
  static Widget get listSmallSeparator => const Space.box(2);
  // static Widget get listSeparator => const Space.box(2);
  static Widget get sectionSeparator => const Space.box(8);
}

class _IconSize {
  const _IconSize();

  double get s => 20;
  double get x => 24;
  double get xl => 28;
  double get xxl => 32;
}

class _BigIconSize {
  const _BigIconSize();

  double get s => 56;
  double get x => 64;
  double get xl => 72;
  double get xxl => 84;
}

class _ButtonSize {
  const _ButtonSize();

  double get sss => 32;
  double get ss => 36;
  double get s => 40;
  double get x => 44;
  double get xl => 48;
  double get xxl => 56;
}

class _ListSize {
  const _ListSize();

  double get s => 48;
  double get x => 56;
  double get xl => 64;
}
