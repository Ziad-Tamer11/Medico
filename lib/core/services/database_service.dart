abstract class DatabaseService {
  //هنا بنضيف البيانات بتاعتنا في ال فايرستور
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });
}
