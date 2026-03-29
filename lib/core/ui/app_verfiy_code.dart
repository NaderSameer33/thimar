import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerfiyCode extends StatelessWidget {
  const AppVerfiyCode({
    super.key,
    this.onCompleted,
    this.topSpacing,
    this.bottomSpacing,
  });
  final void Function(String)? onCompleted;
  final double? topSpacing, bottomSpacing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topSpacing ?? 0,
        bottom: bottomSpacing ?? 0,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          onCompleted: onCompleted,
          cursorHeight: 15.5.h,
          autoFocus: true,
          enableActiveFill: true,

          animationDuration: const Duration(milliseconds: 350),
          animationType: AnimationType.scale,
          keyboardType: TextInputType.number,
          appContext: context,
          length: 4,
          textStyle: const TextStyle(color: Colors.white),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15.r),
            fieldHeight: 60.h,
            fieldWidth: 70.w,
            activeColor: Color(0xffF3F3F3),
            selectedColor: Color(0xffF3F3F3),
            inactiveColor: Color(0xffF3F3F3),
            activeFillColor: const Color(0xff4C8613),
            inactiveFillColor: Color(0xffF3F3F3),
            selectedFillColor: const Color(0xff4C8613),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );
  }
}
