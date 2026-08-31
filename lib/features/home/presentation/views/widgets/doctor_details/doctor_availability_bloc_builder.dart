import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/presentation/manager/doctor_details_cubit/doctor_details_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_content.dart';

class DoctorAvailabilityBlocBuilder extends StatelessWidget {
  const DoctorAvailabilityBlocBuilder({
    super.key,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectedSlot,
    required this.onMonthSelected,
    required this.onDateSelected,
    required this.onSlotSelected,
  });

  final DateTime? selectedMonth;
  final DateTime? selectedDate;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DateTime> onMonthSelected;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DoctorDetailsFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is DoctorDetailsSuccess) {
          return AvailabilityContent(
            doctorEntity: state.doctor,
            selectedMonth: selectedMonth,
            selectedDate: selectedDate,
            selectedSlot: selectedSlot,
            onMonthSelected: onMonthSelected,
            onDateSelected: onDateSelected,
            onSlotSelected: onSlotSelected,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
