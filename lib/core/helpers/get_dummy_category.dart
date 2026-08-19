import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';

CategoryEntity getDummyCategory() {
  return CategoryEntity(name: 'Psychological', id: '');
}

List<CategoryEntity> getDummyCategories() {
  return List.generate(6, (_) => getDummyCategory());
}

DoctorEntity getDummyDoctor() {
  return DoctorEntity(
    id: 'Jennifer Miller',
    name: 'Jennifer Miller',
    specialization: 'Pediatrician',
    workPlace: 'Mercy Hospital',
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
  return List.generate(6, (_) => getDummyDoctor());
}

AppointmentEntity getDummyAppointment() {
  return AppointmentEntity(
    id: 'Jennifer Miller',
    patientId: 'Ziad Tamer',
    doctorId: 'Jennifer Miller',
    doctorName: 'Jennifer Miller',
    date: DateTime.now(),
    time: '4:00 PM',
    amount: 300,
    status: 'confirmed',
    paymentStatus: 'paid',
  );
}

List<AppointmentEntity> getDummyAppointments() {
  return List.generate(6, (_) => getDummyAppointment());
}
