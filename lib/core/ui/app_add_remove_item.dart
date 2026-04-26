import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppAddRemoveItem extends StatefulWidget {
  const AppAddRemoveItem({
    super.key,
    required this.productId,
    this.initialCount = 1,
    this.onChanged,
  });
  final int productId;
  final int initialCount;
  final ValueChanged<int>? onChanged;

  @override
  State<AppAddRemoveItem> createState() => _AppAddRemoveItemState();
}

class _AppAddRemoveItemState extends State<AppAddRemoveItem> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _updateCount(int newCount) {
    setState(() {
      count = newCount;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(count);
    }
  }

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
            onPressed: () {
              _updateCount(count + 1);
            },
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
            onPressed: () {
              if (count > 1) {
                _updateCount(count - 1);
              }
            },
            icon: AppImage(
              image: 'remove.svg',
            ),
          ),
        ],
      ),
    );
  }
}

