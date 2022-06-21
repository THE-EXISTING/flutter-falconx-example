import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/services.dart';

abstract class ProductDatasourceInterface {
  Future<ProductListResponse> getProducts();
  Future<ProductResponse> getProductById({required String id});
}

class ProductRemoteDatasource implements ProductDatasourceInterface {
  ProductRemoteDatasource({
    ProductServiceInterface? productService,
  }) : _productService = productService ?? ProductMockService();
  final ProductServiceInterface _productService;

  @override
  // Future<ProductResponse> getProductById({required String id}) =>
  // UmImplementException()
  Future<ProductResponse> getProductById({required String id}) {
    throw UnimplementedError();
  }

  // @override
  // Future<ProductListResponse> getProducts() =>
  //     _productService.getProducts().noWrapResponse();
  @override
  Future<ProductListResponse> getProducts() {
    throw UnimplementedError();
  }
}
