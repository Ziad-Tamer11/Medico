import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/my_favorites_view_body.dart';

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'My Favorites'),
      body: MyFavoritesViewBody(),
    );
  }
}
