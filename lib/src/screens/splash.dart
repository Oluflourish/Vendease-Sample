import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initialize(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Delay for 1 second to allow for visiblity of the splash screen logo
    Timer(Duration(seconds: 1), () async {
      Navigator.pushReplacementNamed(context, TabNav);
    });
  }

  @override
  void initState() {
    super.initState();
    initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.94,
        child: Stack(
          children: [
            // Center(
            //   child: Image(
            //     height: 180.0,
            //     image: AssetImage('assets/images/logo-full.png'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
