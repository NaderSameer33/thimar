import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/dio_helper.dart';
import '../logic/helper_methods.dart';

class AppResendCode extends StatefulWidget {
  const AppResendCode({super.key, required this.phone});
  final String phone;

  @override
  State<AppResendCode> createState() => _AppResendCodeState();
}

class _AppResendCodeState extends State<AppResendCode> {
  AppState? state;
  Future<void> resendCode() async {
    final formData = FormData.fromMap({
      'phone': widget.phone,
    });
    final response = await DioHelper.sendData(
      endPoint: 'resend_code',
      data: formData,
    );
    if (response.isSucces) {
      
      showMsg(response.succesMessage!);
      state = AppState.success;
    } else {
      showMsg(
        response.exception ?? 'حدثت مشكله يرجي المحاوله لاجقا ',
        isError: true,
      );
      state = AppState.failure;
    }
    setState(() {});
  }

  bool isSend = false;
  final controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Column(
        children: [
          CircularCountDownTimer(
            controller: controller,
            onComplete: () {
              setState(() {
                isSend = true;
              });
            },

            width: 70.w,
            height: 70.h,
            duration: 60,
            fillColor: Color(0xff4C8613),
            ringColor: Color(0xffD8D8D8),
            isReverse: true,
            textFormat: CountdownTextFormat.MM_SS,
            textStyle: TextStyle(
              color: Color(0xff4C8613),
              fontSize: 21.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          if (isSend)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Color(0xff4C8613),
                ),
                fixedSize: Size(140.w, 47.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onPressed: () async {
                await resendCode();
                setState(() {
                  isSend = false;
                });
                controller.restart();
              },
              child: Text(
                textAlign: TextAlign.center,
                'إعادة الإرسال',
                style: TextStyle(
                  color: Color(0xff4C8613),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
