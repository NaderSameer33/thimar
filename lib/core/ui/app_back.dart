import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: Color(0xff4C8613),
        ),
        child: AppImage(
          image: 'back.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
