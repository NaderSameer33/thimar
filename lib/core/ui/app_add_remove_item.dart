import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppAddRemoveItem extends StatefulWidget {
  const AppAddRemoveItem({
    super.key,
    required this.productCount,
  });
  final ValueChanged<int> productCount;
  @override
  State<AppAddRemoveItem> createState() => _AppAddRemoveItemState();
}

class _AppAddRemoveItemState extends State<AppAddRemoveItem> {
  int count = 1;
  void addCount() => setState(() {
    if (count < 10) {
      count++;
      widget.productCount(count);
    }
  });
  void removeCount() => setState(() {
    if (count > 1) {
      count--;
      widget.productCount(count);
    }
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: Color(0xff808080).withValues(alpha: .2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: addCount,
            icon: AppImage(
              image: 'add.svg',
              color: Color(0xff4C8613),
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
              color: Color(0xff4C8613),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: removeCount,
            icon: AppImage(
              image: 'remove.svg',
            ),
          ),
        ],
      ),
    );
  }
}
