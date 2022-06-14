import 'package:core/app.dart';

class AppBlocConsumer<B extends BlocBase<S>, S>
    extends BlocResourceConsumerX<B, S> {
  const AppBlocConsumer({
    super.key,
    super.listener,
    super.exception,
    required super.builder,
    super.bloc,
    super.buildWhen,
    super.listenWhen,
  });

  @override
  State<BlocResourceConsumerX<B, S>> createState() =>
      _AppBlocConsumerState<B, S>();
}

class _AppBlocConsumerState<B extends BlocBase<S>, S>
    extends BlocConsumerStateX<B, S> {
  @override
  void handlerException(BuildContext context, Object exception) {}
}
