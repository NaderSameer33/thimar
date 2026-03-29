import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/new_password_cubit.dart';
import 'cubit/new_password_state.dart';
import '../login/view.dart';
import '../../core/logic/app_valdator.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({
    super.key,
    required this.code,
    required this.phoneNuber,
  });
  final String code, phoneNuber;

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        onChanged: () {
          formKey.currentState!.validate();
        },
        child: BlocProvider(
          create: (context) => NewPasswordCubit(),
          child: Builder(
            builder: (context) {
              final cubit = context.read<NewPasswordCubit>();
              return SafeArea(
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
                        height: 10.h,
                      ),
                      Text(
                        'أدخل كلمة المرور الجديدة',
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 15.sp,
                        ),
                      ),
                      AppInput(
                        validator: AppValdator.passwordValditor,
                        hintText: 'كلمة المرور',
                        prefixIcon: 'password.png',
                        bottomSpacing: 16.h,
                        topSpacing: 16.h,
                      ),
                      AppInput(
                        validator: AppValdator.passwordValditor,
                        bottomSpacing: 20.h,
                        hintText: 'كلمة المرور',
                        prefixIcon: 'password.png',
                      ),
                      BlocConsumer(
                        bloc: cubit,
                        listener: (context, state) {
                          if (state is NewPasswrodSuccessState) {
                            showMsg(state.succesMessage);
                            goTo(LoginView(), canPop: false);
                          } else if (state is NewPasswordFailureState) {
                            showMsg(state.errorMessage, isError: true);
                          }
                        },
                        builder: (context, state) {
                          return AppButton(
                            isLoading: state is NewPasswordLoadingState,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.createNewPassword(
                                  phone: widget.phoneNuber,
                                  code: widget.code,
                                );
                              }
                            },
                            title: 'تغيير كلمة المرور',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrSignup(),
    );
  }
}
