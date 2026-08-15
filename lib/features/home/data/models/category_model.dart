import 'package:medico/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromEntity(CategoryEntity categoryEntity) {
    return CategoryModel(id: categoryEntity.id, name: categoryEntity.name);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }

  toMap() {
    return {'id': id, 'name': name};
  }
}
