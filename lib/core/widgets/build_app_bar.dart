import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(title, style: TextStyles.font24Bold),
    centerTitle: true,
  );
}
