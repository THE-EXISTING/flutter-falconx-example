import 'package:core/app.dart';

class AppSplashScreen extends AppComponent {
  const AppSplashScreen._({required Key key}) : super(key: key);

  static Widget create() =>
      const AppSplashScreen._(key: Key('AppSplashScreen'));

  @override
  Widget buildDefault(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Space.height40,
          Container(
            height: 100,
            alignment: Alignment.center,
            // width: double.infinity,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                // image: AppImages.logo_splash_screen.toImage(),
                // fit: BoxFit.fill,
                // ),
                ),
          ),
          Space.height64,
          const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
