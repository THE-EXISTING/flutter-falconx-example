// ignore_for_file: constant_identifier_names

import 'package:core/app.dart';
import 'package:flutter_falconx_example/core/core.dart';
import 'package:flutter_falconx_example/src/home/data/repositories/datasources/remotes/services/services.dart';

abstract class ProductServiceInterface {
  Future<ProductResponse> getProductById({
    required String id,
  });

  Future<ProductListResponse> getProducts();
}

class ProductFirebaseService extends FirebaseApiService
    implements ProductServiceInterface {
  static const PRODUCT_COLLECTION = 'products';

  @override
  Future<ProductResponse> getProductById({
    required String id,
  }) {
    final response = firestore.collection(PRODUCT_COLLECTION).doc(id).get();
    return response.then(
      (snapshot) => ProductResponse.fromJson(
        snapshot.data(),
      ),
    );
  }

  @override
  Future<ProductListResponse> getProducts() async {
    // final response = await firestore.collection(PRODUCT_COLLECTION).get();
    // return response.docs
    //     .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>?))
    //     .toList();
    throw UnimplementedError();
  }
}
