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
}
