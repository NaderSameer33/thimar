import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.prefixIcon,
    this.topSpacing,
    this.bottomSpacing,
    this.withCountryCode = false,
    required this.hintText,
    this.validator,
    this.controller,
    this.isSearch = false,
    this.isCategories = false,  this.isAccount = false,
  });
  final String? prefixIcon;
  final double? topSpacing, bottomSpacing;
  final bool withCountryCode;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isSearch;
  final bool isCategories;
  final bool isAccount;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.topSpacing ?? 0,
        bottom: widget.bottomSpacing ?? 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.withCountryCode)
            Container(
              height: 60.h,
              width: 69.w,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: BoxBorder.all(
                  color: Color(0xffF3F3F3),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                    image: 'flag.png',
                    height: 20.h,
                    width: 32.w,
                  ),
                  Text(
                    '+966',
                    style: TextStyle(
                      color: Color(0xff4C8613),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            width: 10,
          ),

          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Color(0xffF40000).withValues(alpha: .7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                errorBorder: buildBorder(isError: true),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 15.sp,
                ),
                suffixIcon: widget.isCategories
                    ? Container(
                        margin: EdgeInsets.only(left: 4.r),
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Color(0xff4C8613),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: AppImage(image: 'setting.svg'),
                      )
                    : null,
                prefixIcon: widget.prefixIcon != null
                    ? AppImage(
                        image: widget.prefixIcon!,
                        height: 2.h,
                        width: 2.w,
                        topSpacing: 10,
                        bottomSpacing: 10,
                        color: widget.isAccount ? Color(0xff4C8613) : null,
                      )
                    : null,
                fillColor: widget.isSearch
                    ? Colors.blueGrey[50]
                    : Color(0xffFFFFFF),
                filled: true,
                border: buildBorder(),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder buildBorder({bool isError = false}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.r),
    borderSide: BorderSide(
      color: isError ? Color(0xffF40000) : Color(0xffF3F3F3),
    ),
  );
}
