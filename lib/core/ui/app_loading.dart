import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 16.h,
        width: 16.w,
        child: CircularProgressIndicator(
          color: Color(0xff4C8613),
        ),
      ),
    );
  }
}
