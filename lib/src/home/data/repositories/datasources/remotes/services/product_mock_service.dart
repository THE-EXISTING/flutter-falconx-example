// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/services.dart';

abstract class ProductServiceInterface {
  Future<DocumentSnapshot<ProductResponse>> getProductById({
    required String id,
  });

  Future<DocumentSnapshot<ProductListResponse>> getProducts();
}

class ProductMockService extends FirebaseApiService
    implements ProductServiceInterface {
  static const PRODUCT_COLLECTION = 'products';

  @override
  Future<DocumentSnapshot<ProductResponse>> getProductById({
    required String id,
  }) {
    // final product = firestore.collection(PRODUCT_COLLECTION).doc(id).get();
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<ProductListResponse>> getProducts() {
    throw UnimplementedError();
  }
}
