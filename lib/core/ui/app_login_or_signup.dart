import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../auth/login/view.dart';
import '../../auth/register/view.dart';

import '../logic/helper_methods.dart';

import 'package:flutter/material.dart';

class AppLoginOrSignup extends StatelessWidget {
  const AppLoginOrSignup({
    super.key,

    this.isLogin = false,
  });
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? 'ليس لديك حساب ؟' : 'لديك حساب بالفعل ؟',
              style: TextStyle(
                color: Color(0xff4C8613),
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                onPressed: () =>
                    goTo(isLogin ? const RegisterView() : const LoginView()),
                child: Text(
                  isLogin ? ' تسجيل الأن' : ' تسجيل الدخول',
                  style: TextStyle(
                    color: Color(0xff4C8613),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
