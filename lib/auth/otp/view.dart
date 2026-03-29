import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../creeate_new_password/view.dart';
import '../login/view.dart';
import 'cubit/otp_cubit.dart';
import 'cubit/otp_state.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_login_or_signup.dart';
import '../../core/ui/app_resend_code.dart';
import '../../core/ui/app_verfiy_code.dart';

class OtpVeiw extends StatefulWidget {
  const OtpVeiw({super.key, required this.phoneNumber, this.isRegister = true});
  final String phoneNumber;
  final bool isRegister;

  @override
  State<OtpVeiw> createState() => _OtpVeiwState();
}

class _OtpVeiwState extends State<OtpVeiw> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<OtpCubit>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppImage(
                      image: 'app_logo.png',
                      height: 140.h,
                      width: 140.w,
                      bottomSpacing: 16.h,
                    ),
                    Text(
                      'نسيت كلمة المرور',
                      style: TextStyle(
                        color: Color(0xff4C8613),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            'أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال\n ${widget.phoneNumber}',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 15.sp,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,

                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'تغيير رقم الجوال',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4C8613),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppVerfiyCode(
                      onCompleted: (value) {
                        code = value;
                      },
                      bottomSpacing: 30,
                    ),
                    BlocConsumer(
                      bloc: cubit,
                      listener: (context, state) {
                        if (state is OtpSuccessState) {
                          showMsg(state.succesMessage);
                          goTo(
                            widget.isRegister
                                ? LoginView()
                                : CreateNewPasswordView(
                                    phoneNuber: widget.phoneNumber,
                                    code: code!,
                                  ),
                            canPop: false,
                          );
                        } else if (state is OtpFailureState) {
                          showMsg(state.failureMessage, isError: true);
                        }
                      },
                      builder: (context, state) {
                        return AppButton(
                          isLoading: state is OtpLoadinState,
                          onTap: () {
                            cubit.verfiyOtp(
                              code: code ?? '',
                              phoneNumber: widget.phoneNumber,
                            );
                          },
                          title: 'تأكيد الكود',
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      textAlign: TextAlign.center,
                      'لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد',
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    AppResendCode(
                      phone: widget.phoneNumber,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: AppLoginOrSignup(),
          );
        },
      ),
    );
  }
}
