import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'core/ui/app_image.dart';
import 'auth/login/view.dart';
import 'home/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    final isAuth = CacheHelper.getToken().isNotEmpty;
    super.initState();
    goTo(isAuth ? HomeView() : LoginView(), delayedSeconds: 3, canPop: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BounceInDown(
        duration: Duration(seconds: 1),
        child: Center(
          child: AppImage(
            image: 'app_logo.png',
            height: 150.h,
            width: 150.w,
          ),
        ),
      ),
    );
  }
}
