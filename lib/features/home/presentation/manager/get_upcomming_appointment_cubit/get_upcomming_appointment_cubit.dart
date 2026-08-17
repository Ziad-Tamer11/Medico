import 'package:bloc/bloc.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:meta/meta.dart';

part 'get_upcomming_appointment_state.dart';

class GetUpcommingAppointmentCubit extends Cubit<GetUpcommingAppointmentState> {
  GetUpcommingAppointmentCubit() : super(GetUpcommingAppointmentInitial());
}
