import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/utils/app_images.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Products',
                style: TextStyle(
                  color: AppColors.blackText.withOpacity(0.9),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.dividerColor,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      height: 26,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.5, color: AppColors.dividerColor),
                        ),
                      ),
                      child: TabBar(
                          // labelPadding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          unselectedLabelColor: AppColors.grey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: AppColors.primaryColor,
                          indicatorWeight: 1.5,
                          indicatorColor: AppColors.primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                            letterSpacing: .4,
                          ),
                          isScrollable: true,
                          tabs: [
                            Tab(child: Text("All Products")),
                            Tab(child: Text("Fruits and Vegetables")),
                            Tab(child: Text("Toiletries")),
                          ]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.0),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _tabList(),
                                _tabList(),
                                _tabList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _tabList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
              margin: EdgeInsets.symmetric(vertical: 6.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(7.0)),
              child: Row(
                children: [
                  Image(
                    height: 48.0,
                    width: 48.0,
                    image: AssetImage(index % 2 == 0
                        ? AppImages.product1
                        : AppImages.product2),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Wind air freshner assorted x6...',
                                style: TextStyle(
                                    color: AppColors.darkText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SvgPicture.asset(SvgIcons.addCart),
                          ],
                        ),
                        SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Toiletries',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.5),
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              index % 2 == 0 ? 'Available' : 'Unavailable',
                              style: TextStyle(
                                color: index % 2 == 0
                                    ? AppColors.green
                                    : AppColors.red,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Divider(
                          thickness: 1,
                          color: AppColors.dividerColor,
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              index % 2 == 0 ? 'Kilogram' : 'Each',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              '₦7,350.00',
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
