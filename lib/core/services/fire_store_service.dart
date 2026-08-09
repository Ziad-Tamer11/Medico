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
  }) async {
    await firestore.collection(path).add(data);
  }
}
