import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation.exports.dart';

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.colors.surface,
      statusBarIconBrightness: Brightness.light,
    ));

    return ScreenUtilInit(
      designSize: AppController.instance.runningInMobile ? const Size(375, 830) : const Size(1440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Aplicativo Tasks',
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: AppTheme.colors.background,
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: AppTheme.colors.primary,
              onPrimary: AppTheme.colors.onPrimary,
              surfaceTint: const Color.fromARGB(255, 15, 15, 15),
              secondary: AppTheme.colors.secondary,
              onSecondary: AppTheme.colors.onSecondary,
              background: AppTheme.colors.background,
              onBackground: AppTheme.colors.onBackground,
              surface: AppTheme.colors.surface,
              onSurface: AppTheme.colors.onSurface,
              error: Colors.red,
              onError: const Color.fromARGB(255, 15, 15, 15),
            ),
          ),

          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              // ignore: deprecated_member_use
              data: data.copyWith(textScaleFactor: 1),
              child: Stack(
                children: [
                  child!,
                ],
              ),
            );
          },
          routerConfig: appRoutes,

          // navigatorObservers: [RouteManager()],
          // onGenerateRoute: AppRoutes().generateRoute,
        );
      },
    );
  }
}
