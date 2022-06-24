import 'package:core/app.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/product_firebase_service.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/services.dart';

abstract class ProductDatasourceInterface {
  Future<ProductListResponse> getProducts();
  Future<ProductResponse> getProductById({required String id});
}

class ProductRemoteDatasource implements ProductDatasourceInterface {
  ProductRemoteDatasource({
    ProductServiceInterface? productService,
  }) : _productService = productService ?? ProductFirebaseService();
  final ProductServiceInterface _productService;

  @override
  Future<ProductResponse> getProductById({required String id}) {
    return _productService.getProductById(id: id);
  }

  @override
  Future<ProductListResponse> getProducts() {
    return _productService.getProducts();
  }
}
