import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/app_valdator.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/ui/account_header.dart';
import 'package:thimar/core/ui/app_button.dart';
import 'package:thimar/core/ui/app_image.dart';
import 'package:thimar/core/ui/app_input.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),

                      child: AppImage(
                        image: CacheHelper.getImage(),
                        height: 88.h,
                        width: 83.w,
                      ),
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
                      validator: AppValdator.nameValidator,
                      bottomSpacing: 16.h,
                      topSpacing: 23.h,
                      prefixIcon: 'user.png',
                      hintText: 'اسم المستخدم',
                      isAccount: true,
                    ),
                    AppInput(
                      validator: AppValdator.phoneValidator,
                      withCountryCode: true,
                      bottomSpacing: 16.h,
                      isAccount: true,
                      prefixIcon: 'phone.png',
                      hintText: 'رقم الجوال',
                    ),
                    AppInput(
                      validator: AppValdator.countryValditor,
                      bottomSpacing: 16.h,
                      isAccount: true,
                      prefixIcon: 'country.png',
                      hintText: 'المدينة',
                    ),
                    AppInput(
                      isAccount: true,
                      validator: AppValdator.passwordValditor,
                      hintText: 'كلمة المرور',
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
                  child: AppButton(onTap: () {}, title: 'تعديل البيانات'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
