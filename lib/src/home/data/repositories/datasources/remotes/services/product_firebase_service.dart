// ignore_for_file: constant_identifier_names

import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/services.dart';

abstract class ProductServiceInterface {
  Future<ProductResponse> getProductById({
    required String id,
  });

  Future<ProductListResponse> getProducts();
  Future<ProductResponse> addProduct({
    required Map<String, dynamic> product,
  });
}

class ProductFirebaseService extends FirebaseApiService
    implements ProductServiceInterface {
  static const PRODUCT_COLLECTION = 'products';

  @override
  Future<ProductResponse> getProductById({
    required String id,
  }) {
    return getOne(
      PRODUCT_COLLECTION,
      id,
      converter: ProductResponse.fromJson,
    );
  }

  @override
  Future<ProductListResponse> getProducts() async {
    return getDocs(
      PRODUCT_COLLECTION,
      converter: ProductListResponse.fromDocs,
    );
  }

  @override
  Future<ProductResponse> addProduct({required Map<String, dynamic> product}) {
    throw UnimplementedError();
  }
}
