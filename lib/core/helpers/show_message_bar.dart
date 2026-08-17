import 'package:flutter/material.dart';

void showMessageBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(hours: 1),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
