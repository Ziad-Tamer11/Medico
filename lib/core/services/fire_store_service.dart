import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  //ازاي البياانات دي هيتعملها implement عشان تضاف في الفاير ستور

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //add data
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  //read data
  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  Future<List<Map<String, dynamic>>> getCollectionData({
    required String path,
  }) async {
    final data = await firestore.collection(path).get();
    return data.docs.map((e) {
      return {'id': e.id, ...e.data()};
    }).toList();
  }
}
