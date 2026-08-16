import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

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

DoctorEntity getDummyDoctor() {
  return DoctorEntity(
    id: 'Jennifer Miller',
    name: 'Jennifer Miller',
    specialization: 'Pediatrician',
    workPlace: ',ercy Hospital',
    rating: '4.8',
    experience: 1,
    hourlyRate: 1,
    treated: 1,
    availableDays: [],
    availableHours: ['10:30am - 5:30pm'],
    categoryId: '',
  );
}

List<DoctorEntity> getDummyDoctors() {
  return [
    getDummyDoctor(),
    getDummyDoctor(),
    getDummyDoctor(),
    getDummyDoctor(),
    getDummyDoctor(),
    getDummyDoctor(),
  ];
}
