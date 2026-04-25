import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thimar/core/logic/app_valdator.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/core/ui/account_header.dart';
import 'package:thimar/core/ui/app_button.dart';
import 'package:thimar/core/ui/app_image.dart';
import 'package:thimar/core/ui/app_input.dart';
import 'package:thimar/home/pages/account/user_info/cubit/edit_user_info_cubit.dart';
import 'package:thimar/home/pages/account/user_info/cubit/edit_user_info_state.dart';
part 'components/user_info_image.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  late String image = '';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneContoller = TextEditingController();
  final cityController = TextEditingController();
  final passwordContoller = TextEditingController();
  final confirmPasswrodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    nameController.text = CacheHelper.getUserName();
    phoneContoller.text = CacheHelper.getphoneNumber();
    image = 'KEEP_CURRENT_IMAGE'; // علامة خاصة للصورة الحالية
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneContoller.dispose();
    cityController.dispose();
    passwordContoller.dispose();
    confirmPasswrodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditUserInfoCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        AccountHeader(
                          title: 'البيانات الشخصية',
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        _UserInfoImage(
                          image: (value) {
                            setState(() {
                              image = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          CacheHelper.getUserName(),
                          style: TextStyle(
                            color: Color(0xff4C8613),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CacheHelper.getphoneNumber(),
                          style: TextStyle(
                            color: Color(0xffA7A7A7),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppInput(
                          controller: nameController,
                          validator: AppValdator.nameValidator,
                          bottomSpacing: 16.h,
                          topSpacing: 23.h,
                          prefixIcon: 'user.png',
                          hintText: 'اسم المستخدم',
                          isAccount: true,
                        ),
                        AppInput(
                          controller: phoneContoller,
                          validator: AppValdator.phoneValidator,
                          withCountryCode: true,
                          bottomSpacing: 16.h,
                          isAccount: true,
                          prefixIcon: 'phone.png',
                          hintText: 'رقم الجوال',
                        ),
                        AppInput(
                          controller: cityController,
                          validator: AppValdator.countryValditor,
                          bottomSpacing: 16.h,
                          isAccount: true,
                          prefixIcon: 'country.png',
                          hintText: 'المدينة',
                        ),
                        AppInput(
                          controller: passwordContoller,
                          isAccount: true,
                          validator: AppValdator.passwordValditor,
                          hintText: 'كلمة المرور',
                          prefixIcon: 'password.png',
                          bottomSpacing: 16.h,
                        ),
                        AppInput(
                          controller: confirmPasswrodController,
                          isAccount: true,
                          validator: AppValdator.passwordValditor,
                          hintText: 'تاكيد كلمه المرور ',
                          prefixIcon: 'password.png',
                          bottomSpacing: 16.h,
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BlocConsumer<EditUserInfoCubit, EditUserInfoState>(
                        listener: (context, state) {
                          if (state is EditInfoSuccesState) {
                            showMsg(state.succesMessage);
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          } else if (state is EditInfoFailureState) {
                            showMsg(state.errorMessage);
                          }
                        },
                        builder: (context, state) => AppButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<EditUserInfoCubit>().editUserInfo(
                                imagePath: image,
                                name: nameController.text.trim(),
                                phone: phoneContoller.text.trim(),
                                city: cityController.text.trim(),
                                password: passwordContoller.text.trim(),
                                confirmPassword: confirmPasswrodController.text
                                    .trim(),
                              );
                            }
                          },
                          title: 'تعديل البيانات',
                          isLoading: state is EditInfoLoadingState,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
