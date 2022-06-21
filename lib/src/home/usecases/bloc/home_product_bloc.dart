import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';
// import 'package:core/app.dart';
// import 'package:meta/meta.dart';

// part 'home_product_event.dart';
// part 'home_product_state.dart';

enum HomeProductEvent {
  getProducts,
}

class HomeProductBloc extends ScreenBlocX<HomeProductEvent,
    BlocEvent<HomeProductEvent>, Resource<List<ProductModel?>>> {
  HomeProductBloc({ProductRepository? productRepository})
      : _productRepository = productRepository ?? ProductRepository(),
        super(Resource.init()) {
    // on<HomeProductEvent>((event, emit) {
    // });
  }
  final ProductRepository _productRepository;
  @override
  Future<void> onListenEvent(BlocEvent<HomeProductEvent> event) async {
    switch (event.name) {
      case HomeProductEvent.getProducts:
        // _fetchProducts();
        break;
    }
  }

  // Future<void> _fetchProducts() => fetch<Resource<ProductListModel>>(
  //       key: HomeProductEvent.getProducts,
  //       call: _productRepository.getProducts(),
  //       onResource: (data) {
  //         emitState(data.);
  //         // emit(Resource.success(data.data));
  //       },
  //     );
}
