import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/home/cart/cubit/up_data_cart_state.dart';
import 'package:thimar/home/cart/cubit/up_data_cart_cubit.dart';
import 'app_image.dart';

class AppAddRemoveItem extends StatefulWidget {
  const AppAddRemoveItem({
    super.key,
    required this.productId,
  });
  final int productId;
  @override
  State<AppAddRemoveItem> createState() => _AppAddRemoveItemState();
}

class _AppAddRemoveItemState extends State<AppAddRemoveItem> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpDataCartCubit, UpDataCartState>(
      listener: (context, state) {},
      child: Container(
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
              onPressed: () => context.read<UpDataCartCubit>().increaseCount(
                id: widget.productId,
              ),
              icon: AppImage(
                image: 'add.svg',
                color: Color(0xff4C8613),
              ),
            ),
            Text(
              '${context.watch<UpDataCartCubit>().count}',
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
              onPressed: () => context.read<UpDataCartCubit>().decreaseCount(
                id: widget.productId,
              ),
              icon: AppImage(
                image: 'remove.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
