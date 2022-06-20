import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class ComponentLocaleStateX<T extends StatefulWidgetX>
    extends ComponentStateX<T> {
  ComponentLocaleStateX({super.viewState});

  // ignore: non_constant_identifier_names
  AppLocalizations get Strings => AppLocalizations.of(context);
}
