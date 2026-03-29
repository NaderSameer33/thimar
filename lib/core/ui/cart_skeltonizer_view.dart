import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSkeltonizerView extends StatelessWidget {
  const CartSkeltonizerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => CartSkeltonizerItem(),
    );
  }
}

class CartSkeltonizerItem extends StatelessWidget {
  const CartSkeltonizerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 8.5,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.0196),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 78.h,
            width: 92.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.grey.shade100,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                height: 40.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: 27.h,
            width: 27.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              color: Colors.grey.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
