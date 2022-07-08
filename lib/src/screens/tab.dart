import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/blocs/app_nav_bloc.dart';
import 'package:vendease_test/src/blocs/provider.dart';
import 'package:vendease_test/src/screens/home.dart';
import 'package:vendease_test/src/screens/product.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> _pages = [
    HomeScreen(),
    Container(child: Center(child: Text('Orders'))),
    ProductsScreen(),
    Container(child: Center(child: Text('Invoice'))),
    Container(child: Center(child: Text('Delivery'))),
  ];

  int currentTabIndex = 0; // Defaults to home tab

  AppNavBloc? appNavBloc;

  @override
  Widget build(BuildContext context) {
    appNavBloc = BlocProvider.appNav(context);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: StreamBuilder<int>(
            stream: appNavBloc!.tabIndex,
            builder: (context, snapshot) {
              currentTabIndex = int.tryParse(snapshot.data.toString()) ?? 0;

              return PageStorage(
                bucket: bucket,
                child: _pages[currentTabIndex],
              );
            }),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: Platform.isIOS ? 65.0 : 76.0,
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildMaterialButton("Home", SvgIcons.home, 0),
                buildMaterialButton("Orders", SvgIcons.orders, 1),
                buildMaterialButton("Products", SvgIcons.products, 2),
                buildMaterialButton("Invoice", SvgIcons.invoice, 3),
                buildMaterialButton("Delivery", SvgIcons.delivery, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildMaterialButton(String title, String image, int position) {
    return StreamBuilder<int>(
        stream: appNavBloc!.tabIndex,
        builder: (context, snapshot) {
          currentTabIndex = int.tryParse(snapshot.data.toString()) ?? 0;
          return Expanded(
            child: Container(
              // color: AppColors.lightRed,
              child: InkWell(
                splashColor: AppColors.transparent,
                highlightColor: AppColors.transparent,
                onTap: () => appNavBloc!.setTabIndex(position),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    SvgPicture.asset(
                      image,
                      width: 24.0,
                      height: 24.0,
                      color: currentTabIndex == position
                          ? AppColors.primaryColor
                          : AppColors.darkGrey,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        color: currentTabIndex == position
                            ? AppColors.primaryColor
                            : AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
