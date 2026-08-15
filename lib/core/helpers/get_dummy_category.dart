import 'package:medico/features/home/domain/entities/category_entity.dart';

CategoryEntity getDummyCategory() {
  return CategoryEntity(name: 'Psychological', id: '');
}

List<CategoryEntity> getDummyCategories() {
  return [
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
    getDummyCategory(),
  ];
}
