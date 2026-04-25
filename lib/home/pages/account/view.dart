import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/auth/login/view.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/core/ui/app_image.dart';
import 'package:thimar/home/pages/account/about_us.dart';
import 'package:thimar/home/pages/account/address.dart';
import 'package:thimar/home/pages/account/contact_us.dart';
import 'package:thimar/home/pages/account/issues.dart';
import 'package:thimar/home/pages/account/privacy.dart';
import 'package:thimar/home/pages/account/question.dart';
import 'package:thimar/home/pages/account/user_info/cubit/user_info_cubit.dart';
import 'package:thimar/home/pages/account/user_info/cubit/user_info_state.dart';
import 'package:thimar/home/pages/account/user_info/view.dart';
import 'package:thimar/home/pages/account/wallet.dart';
part 'components/header.dart';
part 'components/account_body.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late UserInfoCubit _userInfoCubit;

  @override
  void initState() {
    super.initState();
    _userInfoCubit = UserInfoCubit()..getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoCubit>.value(
      value: _userInfoCubit,
      child: WillPopScope(
        onWillPop: () async {
          // تحديث البيانات عند الرجوع
          _userInfoCubit.getUserInfo();
          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              _Header(),
              SizedBox(
                height: 16.h,
              ),
              _AccountBody(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userInfoCubit.close();
    super.dispose();
  }
}
