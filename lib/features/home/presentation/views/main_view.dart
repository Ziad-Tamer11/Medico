import 'package:flutter/material.dart';
import 'package:medico/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/home_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
