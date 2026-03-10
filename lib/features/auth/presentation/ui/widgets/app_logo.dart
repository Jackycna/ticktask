import 'package:flutter/material.dart';
import 'package:tick_task/core/common/appImages/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.appLogo, height: 50, width: 50);
  }
}
