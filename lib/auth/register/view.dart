import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../otp/view.dart';
import 'cubit/register_cubit.dart';
import 'cubit/register_state.dart';
import '../../core/logic/app_valdator.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          final cubit = BlocProvider.of<RegisterCubit>(context);
          return Scaffold(
            body: Form(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.validate();
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppImage(
                        image: 'app_logo.png',
                        height: 120.h,
                        width: 120.h,
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
                        'يمكنك تسجيل حساب جديد الأن',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AppInput(
                        controller: cubit.nameController,
                        validator: AppValdator.nameValidator,
                        bottomSpacing: 16.h,
                        topSpacing: 23.h,
                        prefixIcon: 'user.png',
                        hintText: 'اسم المستخدم',
                      ),
                      AppInput(
                        controller: cubit.phoneController,
                        validator: AppValdator.phoneValidator,
                        withCountryCode: true,
                        bottomSpacing: 16.h,

                        prefixIcon: 'phone.png',
                        hintText: 'رقم الجوال',
                      ),
                       AppInput(
                        controller: cubit.cityController,
                        validator: AppValdator.countryValditor,
                        bottomSpacing: 16.h,
                        prefixIcon: 'country.png',
                        hintText: 'المدينة',
                      ),
                      AppInput(
                        controller: cubit.passwordController,
                        validator: AppValdator.passwordValditor,
                        hintText: 'كلمة المرور',
                        prefixIcon: 'password.png',
                        bottomSpacing: 16.h,
                      ),
                      AppInput(
                        controller: cubit.confirmPasswrodController,
                        validator: AppValdator.passwordValditor,
                        hintText: 'كلمة المرور',
                        prefixIcon: 'password.png',
                        bottomSpacing: 16.h,
                      ),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is SuccessState) {
                            showMsg(state.succesMessage);
                            goTo(
                              OtpView(
                                phoneNumber: cubit.phoneController.text.trim(),
                              ),
                            );
                          } else if (state is FaliureState) {
                            showMsg(state.errorMessage, isError: true);
                          }
                        },
                        builder: (context, state) {
                          return AppButton(
                            isLoading: state is LoadingState,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await cubit.clientRegister();
                              }
                            },
                            title: 'تسجيل',
                          );
                        },
                      ),
                    ],
                  ),
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
