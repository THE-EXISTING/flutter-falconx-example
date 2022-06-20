import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class TabScreenLocaleScaffoldStateX<T extends StatefulWidgetX>
    extends TabScreenScaffoldStateX<T> {
  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context);
}
