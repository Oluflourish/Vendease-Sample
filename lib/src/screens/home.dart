import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/utils/app_images.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, Mhiday',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Text('What are you looking for today?'),
                    ],
                  ),
                  Spacer(),
                  Image(
                    height: 30.0,
                    width: 30.0,
                    image: AssetImage(AppImages.profile),
                  ),
                  SizedBox(width: 22.0),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, CartNav),
                      child: SvgPicture.asset(SvgIcons.cart)),
                ],
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'This week',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 12.0),
                          ),
                          SizedBox(width: 2.0),
                          Transform.translate(
                              offset: Offset(0, 4),
                              child: Icon(Icons.arrow_drop_down)),
                          SizedBox(width: 8.0),
                          Spacer(),
                          Text(
                            'View more',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 12.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 36),
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Total Orders',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            SizedBox(height: 18.0),
                            Text(
                              '200',
                              style: TextStyle(
                                  color: AppColors.orangeText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 28.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Product categories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 14.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 136,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              var titles = [
                                'Drinks',
                                'Processed can',
                                'Seafoods'
                              ];
                              var colors = [
                                AppColors.blueCard,
                                AppColors.pinkCard,
                                AppColors.orangeCard
                              ];
                              var images = [
                                AppImages.drinks,
                                AppImages.canFoods,
                                AppImages.seaFoods
                              ];
                              return Container(
                                width: 130,
                                padding: EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 8.0),
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image(
                                        height: 60.0,
                                        width: 64.0,
                                        image: AssetImage(images[index]),
                                      ),
                                    ),
                                    SizedBox(height: 14.0),
                                    Text(
                                      titles[index],
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 38.0),
                      Text(
                        'Recent order list',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        child: ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Material(
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: index == 0
                                          ? AppColors.green.withOpacity(0.6)
                                          : AppColors.red.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14.0, horizontal: 16.0),
                                      margin: EdgeInsets.only(left: 8.0),
                                      color: AppColors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'P0160984146427',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColors.black
                                                        .withOpacity(0.6)),
                                              ),
                                              SizedBox(height: 14.0),
                                              Text(
                                                'Jan 3, 2021  10:11 AM',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: AppColors.black
                                                        .withOpacity(0.4)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '₦ 8,000',
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: AppColors.black
                                                        .withOpacity(0.4)),
                                              ),
                                              SizedBox(height: 14.0),
                                              Text(
                                                '2 days ago',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
