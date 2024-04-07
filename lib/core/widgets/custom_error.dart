import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, error, [Color? color]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color ?? Colors.red,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Text(error))));
}
