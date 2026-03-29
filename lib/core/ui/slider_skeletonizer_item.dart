import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliderSketonizerItem extends StatelessWidget {
  const SliderSketonizerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade300,
      ),
      child: Container(
        height: 164.h,
        width: 375.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
