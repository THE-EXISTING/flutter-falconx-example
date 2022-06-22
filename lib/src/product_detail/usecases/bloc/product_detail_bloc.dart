import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

enum ProductDetailEvent {
  getDetail,
}

class ProductDetailBloc extends ScreenBlocX<ProductDetailEvent,
    BlocEvent<ProductDetailEvent>, Resource<ProductModel?>> {
  ProductDetailBloc({
    required this.productId,
    ProductRepository? productRepository,
  })  : _productRepository = productRepository ?? ProductRepository(),
        super(Resource.init());
  final ProductRepository _productRepository;
  final String productId;

  @override
  Future<void> onListenEvent(BlocEvent<ProductDetailEvent> event) async {
    switch (event.name) {
      case ProductDetailEvent.getDetail:
        _fetchProduct(id: productId);
        break;
    }
  }

  void _fetchProduct({required String id}) => fetch<Resource<ProductModel?>>(
        key: HomeProductEvent.getProducts,
        call: _productRepository.getProductById(id: id),
        onResource: (data) {
          emitState(data);
        },
      );
}
