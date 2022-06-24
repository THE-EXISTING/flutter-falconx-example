import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

enum HomeProductEvent {
  getProducts,
}

class HomeProductBloc extends ScreenBlocX<HomeProductEvent,
    BlocEvent<HomeProductEvent>, Resource<ProductListModel>> {
  HomeProductBloc({ProductRepository? productRepository})
      : _productRepository = productRepository ?? ProductRepository(),
        super(Resource.init());
  final ProductRepository _productRepository;
  @override
  Future<void> onListenEvent(BlocEvent<HomeProductEvent> event) async {
    switch (event.name) {
      case HomeProductEvent.getProducts:
        _fetchProducts();
        break;
    }
  }

  void _fetchProducts() => fetch<Resource<ProductListModel>>(
        key: HomeProductEvent.getProducts,
        call: _productRepository.getProducts(),
        onResource: (data) {
          emitState(data);
        },
      );
}
