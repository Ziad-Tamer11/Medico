import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoResult(text: 'No notifications found');
  }
}
