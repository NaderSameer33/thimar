import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navKey = GlobalKey<NavigatorState>();
void goTo(Widget page, {bool canPop = true, int? delayedSeconds}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      CupertinoPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayedSeconds != null) {
    Timer(Duration(seconds: delayedSeconds), () {
      action();
    });
  } else {
    action();
  }
}

void showMsg(String text, {bool isError = false}) {
  if (text.isNotEmpty) {
    ScaffoldMessenger.of(
      navKey.currentContext!,
    ).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Color(0xff4C8613),
        duration: const Duration(seconds: 3),
        content: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
