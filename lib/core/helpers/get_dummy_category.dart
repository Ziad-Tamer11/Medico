import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

CategoryEntity getDummyCategory() {
  return CategoryEntity(id: 0, name: 'Psychological');
}

List<CategoryEntity> getDummyCategories() {
  return List.generate(6, (_) => getDummyCategory());
}

DoctorEntity getDummyDoctor() {
  return DoctorEntity(
    id: 0,
    name: 'Jennifer Miller',
    specialty: 'Pediatrics',
    workPlace: 'Mercy Hospital',
    experience: 1,
    treated: 1,
    hourlyRate: 1,
    rating: 4.8,
    isActive: true,
    categoryId: 0,
  );
}

List<DoctorEntity> getDummyDoctors() {
  return List.generate(6, (_) => getDummyDoctor());
}

AppointmentEntity getDummyAppointment() {
  return AppointmentEntity(
    id: 0,
    doctorId: 0,
    doctorName: 'Jennifer Miller',
    date: DateTime.now(),
    startTime: '16:00',
    endTime: '17:00',
    createdAt: DateTime.now(),
  );
}

List<AppointmentEntity> getDummyAppointments() {
  return List.generate(6, (_) => getDummyAppointment());
}
