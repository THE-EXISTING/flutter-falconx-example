import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseApiService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<T> getDocs<T>(
    String collection, {
    String? id,
    Map<String, dynamic>? params,
  }) async {
    final response = await firestore.collection(collection).get();
    return response.docs.map((doc) => doc.data()).toList() as T;
  }

  Future<T> getOne<T>(
    String collection,
    String id, {
    Map<String, dynamic>? params,
  }) async {
    final response = await firestore.collection(collection).doc(id).get();
    return response.data() as T;
  }
}
