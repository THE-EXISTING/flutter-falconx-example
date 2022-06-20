import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ScreenLocaleScaffoldBlocStateX<T extends StatefulWidgetX,
    B extends BlocBase<S>, S> extends ScreenScaffoldBlocStateX<T, B, S> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context);

  @override
  void onExceptionBloc(dynamic context, dynamic exception) {
    super.onExceptionBloc(context, exception);
  }

  @override
  Widget buildPageLoadingIndicator() {
    return Container();
    // return const AppLinearLoadingIndicator();
  }
}
