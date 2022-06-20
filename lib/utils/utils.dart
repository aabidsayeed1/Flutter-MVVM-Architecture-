import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarError(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(30),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(30),
          duration: const Duration(seconds: 2),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.blue,
        content: Text(message)));
  }
}
