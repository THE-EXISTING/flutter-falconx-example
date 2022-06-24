import 'package:core/app.dart';

// ignore_for_file: prefer_const_constructors_in_immutables
class AppEmptyView extends AppComponent {
  AppEmptyView({
    super.key,
    // required this.icon,
    required this.text,
    required this.themeMode,
    this.contentColor,
  });

  // final String icon;
  final String text;
  final ThemeMode themeMode;
  final Color? contentColor;

  Color get getColor {
    return contentColor ??
        (themeMode == ThemeMode.dark
            ? AppColors.icon.whiteDivider
            : AppColors.icon.blackDivider);
  }

  @override
  Widget buildDefault(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 48),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // icon.toSvg(
            //   color: getColor,
            //   height: AppSize.bigIcon.x,
            //   width: AppSize.bigIcon.x,
            // ),
            Space.height8,
            AppText(
              text,
              style: AppTextStyle.primary.title1.custom(
                color: getColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
