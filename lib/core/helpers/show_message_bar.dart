import 'package:flutter/material.dart';

void showMessageBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 300),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
