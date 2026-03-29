import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/home/view.dart';
import 'package:thimar/play_with_widget.dart';
import 'package:thimar/splash.dart';
import 'core/logic/bloc_observer_implmentaion.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    const Thimar(),
  );

  Bloc.observer = BlocObserverImplmentaion();
}

class Thimar extends StatelessWidget {
  const Thimar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),

      child: MaterialApp(
        locale: Locale('ar'),
        supportedLocales: [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: DevicePreview.appBuilder,
        navigatorKey: navKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Tajawal',
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
