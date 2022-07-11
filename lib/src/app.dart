import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:vendease_test/src/blocs/provider.dart';
import 'package:vendease_test/src/screens/cart.dart';
import 'package:vendease_test/src/screens/tab.dart';
import 'package:vendease_test/src/screens/splash.dart';
import 'package:vendease_test/src/utils/app_fonts.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return BlocProvider(
      child: StyledToast(
        locale: const Locale('en', 'US'),
        toastAnimation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.fade,
        toastPositions: StyledToastPosition.bottom,
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastLinearToSlowEaseIn,
        dismissOtherOnShow: true,
        child: ScreenUtilInit(
            designSize: Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: EasyLoading.init(),
                onGenerateRoute: (RouteSettings settings) => routes(settings),
                theme: ThemeData(
                  fontFamily: AppFonts.gilroy,
                  textTheme:
                      Theme.of(context).textTheme.apply(fontSizeFactor: 1.sp),
                  primaryColor: AppColors.primaryColor,
                  scaffoldBackgroundColor: AppColors.white,
                  textButtonTheme:
                      TextButtonThemeData(style: TextButton.styleFrom()),
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
              );
            }),
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

        case TabNav:
          BlocProvider.product(context).getProducts();
          BlocProvider.cart(context).init();
          return TabScreen();

        case HomeTabNav:
          BlocProvider.appNav(context).setTabIndex(0);
          return TabScreen();

        case ProductsTabNav:
          BlocProvider.appNav(context).setTabIndex(2);
          return TabScreen();

        case CartNav:
          return CartScreen();

        default:
          return SplashScreen();
      }
    },
  );
}
