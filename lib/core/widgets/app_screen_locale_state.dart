import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class AppLocaleScreen extends StatelessWidgetX {
  const AppLocaleScreen({
    super.key,
    ViewState? state,
  }) : state = state ?? ViewState.normal;
  final ViewState state;

  bool get isNormal => state == ViewState.normal;

  bool get isNotNormal => !isNormal;

  bool get isLoading => state == ViewState.loading;

  bool get isNotLoading => !isLoading;

  bool get isEmpty => state == ViewState.empty;

  bool get isNotEmpty => !isEmpty;

  bool get isError => state == ViewState.error;

  bool get isNotError => !isError;

  @protected
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    switch (state) {
      case ViewState.normal:
        return buildDefault(context, strings);
      case ViewState.loading:
        return buildLoading(context, strings);
      case ViewState.empty:
        return buildEmpty(context, strings);
      case ViewState.disabled:
        return buildDisabled(context, strings);
      case ViewState.error:
        return buildError(context, strings);
    }
  }

  Widget buildDefault(BuildContext context, AppLocalizations strings);

  Widget buildLoading(BuildContext context, AppLocalizations strings) {
    return buildDefault(context, strings);
  }

  Widget buildEmpty(BuildContext context, AppLocalizations strings) {
    return buildDefault(context, strings);
  }

  Widget buildDisabled(BuildContext context, AppLocalizations strings) {
    return buildDefault(context, strings);
  }

  Widget buildError(BuildContext context, AppLocalizations strings) {
    return buildDefault(context, strings);
  }
}
