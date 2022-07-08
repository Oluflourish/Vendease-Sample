import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendease_test/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  // initialize screenutil
  ScreenUtil.ensureScreenSize();
  runApp(App());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..contentPadding = EdgeInsets.all(28.0)
    ..dismissOnTap = true;
}
