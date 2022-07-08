import 'package:flutter/material.dart';
import 'package:vendease_test/src/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  initialize(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
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
            Center(child: Text('Home Screen')),
          ],
        ),
      ),
    );
  }
}
