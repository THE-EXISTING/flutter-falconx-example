import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/home.dart';

abstract class HomeProductRepositoryInterface {
  Stream<Resource<ProductListModel>> getProducts();

  Stream<Resource<ProductModel>> getProductById({required String id});
}

class ProductRepository implements HomeProductRepositoryInterface {
  ProductRepository({
    ProductDatasourceInterface? productDatasource,
  }) : _productDatasource = productDatasource ?? ProductRemoteDatasource();

  final ProductDatasourceInterface _productDatasource;

  @override
  Stream<Resource<ProductModel>> getProductById({required String id}) {
    return NetworkBoundResource.asStream<ProductModel, ProductResponse>(
      createCallFuture: () => _productDatasource.getProductById(id: id),
      processResponse: ProductModel.fromResponse,
      error: (dynamic exception, StackTrace stackTrace) {
        Log.e(exception, stackTrace);
      },
    );
  }

  @override
  Stream<Resource<ProductListModel>> getProducts() {
    return NetworkBoundResource.asStream<ProductListModel, ProductListResponse>(
      createCallFuture: _productDatasource.getProducts,
      processResponse: ProductListModel.fromMapResponse,
      error: (dynamic exception, StackTrace stackTrace) {
        Log.e(exception, stackTrace);
      },
    );
  }
}
