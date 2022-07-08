import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:vendease_test/src/screens/home.dart';
import 'package:vendease_test/src/screens/splash.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return StyledToast(
      locale: const Locale('en', 'US'),
      toastAnimation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.fade,
      toastPositions: StyledToastPosition.top,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastLinearToSlowEaseIn,
      dismissOtherOnShow: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        onGenerateRoute: (RouteSettings settings) => routes(settings),
        theme: ThemeData(
          //   fontFamily: GoogleFonts.manrope().fontFamily,
          //   textTheme: GoogleFonts.manropeTextTheme(
          //     Theme.of(context).textTheme,
          //   ),
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.white,
          textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(16.0),
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(double.infinity, 10),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.textColor),
            titleTextStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      switch (settings.name) {
        case SplashNav:
          return SplashScreen();

        case HomeNav:
          return HomeScreen();

        default:
          return SplashScreen();
      }
    },
  );
}
