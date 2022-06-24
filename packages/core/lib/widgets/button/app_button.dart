import 'package:core/app.dart';

class AppButton extends AppComponent {
  const AppButton({
    super.key,
    Widget? child,
    String? title,
    Color? titleColor,
    Color? color,
    Color? borderColor,
    double borderRadius = 8,
    double borderWidth = 2,
    double height = 56,
    double width = 100,
    bool enabled = true,
    bool loading = false,
    VoidCallback? onPressed,
    Color? overlayColor,
  })  : assert(
          child != null || title != null,
          'Please enter child or title.',
        ),
        _child = child,
        _title = title,
        _titleColor = titleColor,
        _color = color,
        _borderColor = borderColor,
        _borderRadius = borderRadius,
        _borderWidth = borderWidth,
        _height = height,
        _width = width,
        _onPressed = onPressed,
        _enabled = enabled,
        _loading = loading,
        _overlayColor = overlayColor;

  static AppButton bottom({
    required String title,
    VoidCallback? onPressed,
    bool loading = false,
    Color? titleColor,
    Color? color,
    bool enabled = true,
  }) =>
      AppButton(
        title: title,
        width: double.infinity,
        height: AppSize.button.xl,
        borderRadius: 0,
        enabled: enabled,
        onPressed: onPressed,
        loading: loading,
        titleColor: titleColor,
        color: color,
      );

  static AppButton outline({
    required String title,
    double? width,
    double? height,
    Color? titleColor,
    VoidCallback? onPressed,
    bool enabled = true,
    Color? color,
  }) =>
      AppButton(
        title: title,
        titleColor: titleColor ?? AppColors.primary,
        color: color ?? AppColors.transparent,
        width: width ?? double.infinity,
        height: height ?? AppSize.button.xl,
        borderColor: AppColors.blackTransparent10,
        onPressed: onPressed,
        enabled: enabled,
      );

  final Widget? _child;
  final String? _title;
  final Color? _titleColor;
  final Color? _color;
  final Color? _borderColor;
  final double _borderRadius;
  final double _borderWidth;
  final double _height;
  final double _width;
  final VoidCallback? _onPressed;
  final bool _enabled;
  final bool _loading;
  final Color? _overlayColor;

  @override
  Widget buildDefault(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(_width, _height),
        ),
        overlayColor: MaterialStateProperty.all(_overlayColor),
        shadowColor: MaterialStateProperty.all<Color>(AppColors.transparent),
        backgroundColor: MaterialStateProperty.all<Color>(
          _enabled && !_loading
              ? _getBackgroundColor(context)
              : _getDisabledColor(context),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          (_borderColor != null)
              ? BorderSide(
                  color: _borderColor ?? Theme.of(context).primaryColor,
                  width: _borderWidth,
                )
              : BorderSide.none,
        ),
      ),
      // onPressed: null,
      onPressed:
          _enabled && !_loading && _onPressed != null ? _onPressed : null,
      child: _child ??
          (_loading
              ? const CircularProgressIndicator()
              : AppText(
                  _title,
                  style: AppTextStyle.primary.button.custom(
                    color: _enabled && !_loading
                        ? (_titleColor ?? AppColors.text.whiteActive)
                        : AppColors.text.blackDisabled,
                  ),
                )),
    );
  }

  Color _getBackgroundColor(BuildContext context) =>
      _color ?? Theme.of(context).primaryColor;

  Color _getDisabledColor(BuildContext context) {
    // if (_loading) {
    //   Color normalColor = _getBackgroundColor(context);
    //   return normalColor.withAlpha(192);
    // } else {
    return AppColors.mercuryGrey;
    // }
  }
}
