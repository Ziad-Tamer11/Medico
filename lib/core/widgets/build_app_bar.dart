import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF32384B),
        fontSize: 24,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w700,
        height: 1.40,
      ),
    ),
    centerTitle: true,
  );
}
