import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSkeletonView extends StatelessWidget {
  const ProductSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
      child: GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 170 / 250,
        ),
        itemBuilder: (context, index) => const ProductSkeletonItem(),
      ),
    );
  }
}

class ProductSkeletonItem extends StatelessWidget {
  const ProductSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),

          SizedBox(height: 10.h),

          Container(
            height: 12.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),

          SizedBox(height: 6.h),

          Container(
            height: 10.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              Container(
                height: 12.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 10.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              Spacer(),

              Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
