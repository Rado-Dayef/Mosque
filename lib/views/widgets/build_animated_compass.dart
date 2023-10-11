import 'package:com.rado.mosque/controllers/setting_controller.dart';
import 'package:com.rado.mosque/controllers/compass_controller.dart';
import 'package:com.rado.mosque/views/constants/app_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildAnimatedCompass() {
  final CompassController compassController = Get.put(CompassController());
  return Obx(
        () {
      final targetAngle = compassController.begin.value;
      return TweenAnimationBuilder(
        duration: const Duration(
          milliseconds: 500,
        ),
        tween: Tween<double>(
          begin: 0.0,
          end: targetAngle,
        ),
        builder: (BuildContext context, double angle, Widget? child) {
          return Transform.rotate(
            angle: angle,
            child: Image.asset(
              isDarkTheme == true ? AppConstants.compassGreyIconImage : AppConstants.compassBlueIconImage,
              height: 250.sp,
              width: 250.sp,
            ),
          );
        },
      );
    },
  );
}
