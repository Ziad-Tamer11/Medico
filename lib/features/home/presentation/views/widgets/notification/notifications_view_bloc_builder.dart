import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/features/home/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/notification/notifications_view_body.dart';

class NotificationsViewBlocBuilder extends StatelessWidget {
  const NotificationsViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading || state is NotificationInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NotificationFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is NotificationSuccess) {
          return NotificationsViewBody(appointments: state.appointments);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
