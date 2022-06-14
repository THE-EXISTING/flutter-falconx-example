import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ScreenLocaleScaffoldStateX<T extends StatefulWidgetX>
    extends ScreenScaffoldStateX<T> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context);
}
