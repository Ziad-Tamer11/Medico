import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // emptyState
        const NoResult(text: 'No notifications found'),
      ],
    );
  }
}

//    resultState
//    const NotificationItem()
