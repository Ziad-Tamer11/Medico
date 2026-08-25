import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/manager/doctor_availability_cubit/doctor_availability_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_content.dart';

class DoctorAvailabilityBlocBuilder extends StatelessWidget {
  const DoctorAvailabilityBlocBuilder({
    super.key,
    required this.doctorEntity,
    required this.selectedDate,
    required this.selectedSlot,
    required this.onDateSelected,
    required this.onSlotSelected,
  });

  final DoctorEntity doctorEntity;
  final DateTime? selectedDate;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAvailabilityCubit, DoctorAvailabilityState>(
      builder: (context, state) {
        if (state is DoctorAvailabilityLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DoctorAvailabilityFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is DoctorAvailabilitySuccess) {
          return AvailabilityContent(
            doctorEntity: doctorEntity,
            availability: state.availability,
            selectedDate: selectedDate,
            selectedSlot: selectedSlot,
            onDateSelected: onDateSelected,
            onSlotSelected: onSlotSelected,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
