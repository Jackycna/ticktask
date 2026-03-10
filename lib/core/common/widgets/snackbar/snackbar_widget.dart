import 'package:flutter/material.dart';
import 'package:tick_task/core/router/routes.dart';

class SnackbarWidget {
  static void showsnakbar({int duration = 4, required String content}) {
    try {
      final context = Routes.scaffoldKey.currentState;
      context?.clearSnackBars();
      context?.showSnackBar(
        SnackBar(
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.symmetric(horizontal: 10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(content, style: TextStyle(color: Colors.red)),
            ),
          ),
          backgroundColor: Color(0xFF333333).withValues(alpha: 0.9),
          duration: Duration(seconds: duration),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
          dismissDirection: DismissDirection.down,
        ),
        snackBarAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          reverseCurve: Curves.bounceIn,
          reverseDuration: Duration(milliseconds: 300),
        ),
      );
      print("done");
    } catch (e) {
      print("hello");
      debugPrint(e.toString());
    }
  }
}
