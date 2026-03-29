import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/forget_passwrod_cubit.dart';
import 'cubit/forget_passwrod_state.dart';
import '../otp/view.dart';
import '../../core/logic/app_valdator.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';

class ForgetPasswrodView extends StatefulWidget {
  const ForgetPasswrodView({super.key});

  @override
  State<ForgetPasswrodView> createState() => _ForgetPasswrodViewState();
}

class _ForgetPasswrodViewState extends State<ForgetPasswrodView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswrodCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ForgetPasswrodCubit>();
          return Scaffold(
            body: Form(
              key: formKey,
              onChanged: () {
                formKey.currentState!.validate();
              },
              child: SafeArea(
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
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'أدخل رقم الجوال المرتبط بحسابك',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        validator: AppValdator.phoneValidator,
                        hintText: 'رقم الجوال',
                        withCountryCode: true,
                        topSpacing: 29.h,
                        bottomSpacing: 16.h,
                        prefixIcon: 'phone.png',
                      ),
                      BlocConsumer(
                        bloc: cubit,

                        listener: (context, state) {
                          if (state is ForgetpassSuccessState) {
                            showMsg(state.succesMessage);
                            goTo(
                              OtpVeiw(
                                isRegister: false,
                                phoneNumber: cubit.phoneController.text.trim(),
                              ),
                            );
                          } else if (state is ForgetpassFailureState) {
                            showMsg(state.errorMessage, isError: true);
                          }
                        },
                        builder: (context, state) {
                          return AppButton(
                            isLoading: state is ForgetpassLoadingState,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.forgetPasswrod();
                              }
                            },
                            title: 'تأكيد رقم الجوال',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
