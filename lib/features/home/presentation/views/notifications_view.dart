import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/doctors/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/home/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/notification/notifications_view_bloc_builder.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Notifications'),
      body: BlocProvider(
        create: (context) => NotificationCubit(
          appointmentUseCase: getIt<AppointmentUseCase>(),
        )..getNotifications(),
        child: const NotificationsViewBlocBuilder(),
      ),
    );
  }
}
