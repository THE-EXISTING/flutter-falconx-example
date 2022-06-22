import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/app.dart';

abstract class FirebaseApiService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  // There's withCoverter : https://firebase.flutter.dev/docs/firestore/usage#writing-data
  // It's hard to implement with abstract function
  Future<T> getDocs<T>(
    String collection, {
    String? id,
    Map<String, dynamic>? params,
    String? orderBy,
    int? limit,
    T? lastDocument,
    required T Function(List<Map<String, dynamic>> json) converter,
  }) async {
    final query = firestore.collection(collection);
    if (orderBy != null) query.orderBy(orderBy);
    if (limit != null) query.limit(limit);
    if (lastDocument != null) query.startAfter([lastDocument]);
    final response = await query.get();
    final listReponse = response.docs.map<Map<String, dynamic>>(
      (e) => <String, dynamic>{
        'id': e.id,
        ...e.data(),
      },
    );
    return converter(listReponse.toList());
  }

  Future<T> getOne<T>(
    String collection,
    String id, {
    Map<String, dynamic>? params,
    required T Function(Map<String, dynamic>? json) converter,
  }) async {
    final response = await firestore.collection(collection).doc(id).get();
    return response.data().mapJson<T>(
          (val) => converter(<String, dynamic>{
            ...?val,
            'id': response.id,
          }),
        );
  }

  Future<bool> addOne<T>(
    String collection, {
    String? id,
    required Map<String, dynamic> data,
  }) async {
    return firestore
        .collection(collection)
        .add(data)
        .then((value) => true)
        .catchError((dynamic error) {
      log("There's sometinh wrong $error");
    });
  }
}
