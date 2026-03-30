import 'package:flutter/material.dart';
import 'package:thimar/core/ui/app_back.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAccountAppBar(title: 'البيانات الشخصية'),
      body: Center(
        child: Text('userInfo'),
      ),
    );
  }
}

class CustomAccountAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAccountAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      leading: AppBack(),
      centerTitle: true,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
