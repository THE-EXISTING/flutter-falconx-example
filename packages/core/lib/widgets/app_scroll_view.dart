import 'package:core/app.dart';

class AppScrollView extends AppComponent {
  const AppScrollView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget buildDefault(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowScrollBehavior(),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  const NoGlowScrollBehavior();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}
