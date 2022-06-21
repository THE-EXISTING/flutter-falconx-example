import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

abstract class HomeProductRepositoryInterface {
  Stream<Resource<List<ProductModel>>> getProducts();

  Stream<Resource<ProductModel>> getProductById({required String id});
}

class ProductRepository implements HomeProductRepositoryInterface {
  ProductRepository({
    ProductDatasourceInterface? productDatasource,
  }) : _productDatasource = productDatasource ?? ProductRemoteDatasource();

  final ProductDatasourceInterface _productDatasource;

  @override
  Stream<Resource<ProductModel>> getProductById({required String id}) {
    return NetworkBoundResource.asStream(
      createCallFuture: () => _productDatasource.getProductById(id: id),
      error: (dynamic exception, StackTrace stackTrace) {
        Log.e(exception, stackTrace);
      },
    );
  }

  @override
  Stream<Resource<List<ProductModel>>> getProducts() {
    return NetworkBoundResource.asStream<List<ProductModel>,
        ProductListResponse>(
      createCallFuture: _productDatasource.getProducts,
      error: (dynamic exception, StackTrace stackTrace) {
        Log.e(exception, stackTrace);
      },
    );
  }
}
