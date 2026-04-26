import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';
import '../register/cubit/register_state.dart';
import '../../core/logic/app_valdator.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';
import '../forget_passwrod/view.dart';
import '../../home/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final cubit = context.read<LoginCubit>();
            return Form(
              key: formKey,
              onChanged: () {
                formKey.currentState!.validate();
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.r),
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
                        'مرحبا بك مرة أخرى',
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
                        'يمكنك تسجيل الدخول الأن',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AppInput(
                        validator: AppValdator.phoneValidator,
                        hintText: 'رقم الجوال',
                        withCountryCode: true,
                        topSpacing: 29.h,
                        bottomSpacing: 16.h,
                        prefixIcon: 'phone.png',
                        controller: cubit.phoneController,
                      ),
                      AppInput(
                        controller: cubit.passwordController,
                        validator: AppValdator.passwordValditor,

                        hintText: 'كلمة المرور',
                        prefixIcon: 'password.png',
                        bottomSpacing: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            goTo(ForgetPasswrodView());
                          },
                          child: Text(
                            'نسيت كلمة المرور ؟',

                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      BlocConsumer(
                        bloc: cubit,
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            showMsg(state.succesMessage);
                            goTo(HomeView(), canPop: false, delayedSeconds: 1);
                          } else if (state is LoginFailureState) {
                            showMsg(state.errorMessage, isError: true);
                          }
                        },
                        builder: (context, state) {
                          return AppButton(
                            isLoading: state is LoginLoadingState,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser();
                              }
                            },
                            title: 'تسجيل الدخول',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: AppLoginOrSignup(
          isLogin: true,
        ),
      ),
    );
  }
}
