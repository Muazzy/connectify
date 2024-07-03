import 'package:connectify/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:connectify/common/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Connectify',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: Colors.purple,
                onPrimary: Colors.white,
                secondary: Colors.purple.shade100,
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.white,
                background: Colors.white,
                onBackground: Colors.purple.shade900,
                surface: Colors.white,
                onSurface: Colors.purple.shade900,
              ),
              fontFamily: 'Poppins',
            ),
            home: const LoginView(),
          );
        },
      ),
    );
  }
}
