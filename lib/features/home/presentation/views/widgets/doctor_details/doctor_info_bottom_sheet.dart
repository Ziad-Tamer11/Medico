import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/widgets/drag_handle.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/domain/usecases/doctor_usecase.dart';
import 'package:medico/features/home/presentation/manager/doctor_details_cubit/doctor_details_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_availability_bloc_builder.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_info_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_working_hours_bloc_builder.dart';

class DoctorInfoBottomSheet extends StatefulWidget {
  const DoctorInfoBottomSheet({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;

  @override
  State<DoctorInfoBottomSheet> createState() => _DoctorInfoBottomSheetState();
}

class _DoctorInfoBottomSheetState extends State<DoctorInfoBottomSheet> {
  DateTime? selectedMonth;
  DateTime? selectedDate;
  DoctorAvailabilityEntity? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorDetailsCubit(doctorUsecase: getIt<DoctorUsecase>())
            ..getDoctorById(widget.doctorEntity.id),
      child: Container(
        height: MediaQuery.of(context).size.height * .61,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 24, right: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DragHandle(),
            DoctorInfoSection(doctorEntity: widget.doctorEntity),
            const SizedBox(height: 12),
            const DoctorWorkingHoursBlocBuilder(),
            const SizedBox(height: 24),
            Divider(color: AppColor.blueGrey),
            Expanded(
              child: DoctorAvailabilityBlocBuilder(
                selectedMonth: selectedMonth,
                selectedDate: selectedDate,
                selectedSlot: selectedSlot,
                onMonthSelected: (month) {
                  setState(() {
                    selectedMonth = month;
                    selectedDate = null;
                    selectedSlot = null;
                  });
                },
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                    selectedSlot = null;
                  });
                },
                onSlotSelected: (slot) {
                  setState(() {
                    selectedSlot = slot;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
