import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/utils/app_fonts.dart';
import 'package:vendease_test/src/utils/app_images.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 6.0,
      width: 6.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.orangeText : AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome, ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0.sp,
                            color: AppColors.black.withOpacity(0.6),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Mhiday',
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        'What are you looking for today?',
                        style: TextStyle(
                            fontFamily: AppFonts.lato,
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: 14.0.sp),
                      ),
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0.sp,
                                fontFamily: AppFonts.lato,
                                color: AppColors.black.withOpacity(0.6)),
                          ),
                          SizedBox(width: 6.0),
                          PopupMenuButton<String>(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'This week',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12.0.sp,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-2, 4),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            onSelected: (String vale) {},
                            offset: Offset(0, 36),
                            itemBuilder: (BuildContext context) {
                              return ['This week', 'This month', 'This year']
                                  .map((String title) {
                                return PopupMenuItem<String>(
                                  value: title,
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        color: AppColors.black, fontSize: 12.5),
                                  ),
                                );
                              }).toList();
                            },
                          ),
                          Spacer(),
                          Text(
                            'View more',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.0.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() => _currentPage = page);
                            },
                            children: [
                              _homeCard('Total Orders', '200'),
                              _homeCard('Total Products', '2,000'),
                              _homeCard('Total Invoices', '250'),
                              _homeCard('Total Deliveries', '600'),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 120),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Product categories',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0.sp),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14.0.sp),
                          ),
                        ],
                      ),
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
                              margin: EdgeInsets.only(left: 14.0, right: 6.0),
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
                                        color: AppColors.black.withOpacity(0.8),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 38.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent order list',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? AppColors.green.withOpacity(0.6)
                                            : AppColors.red.withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.08),
                                            spreadRadius: 0.5,
                                            blurRadius: 6,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
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
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
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

  Container _homeCard(String title, String count) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 36, bottom: 24),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: '', fontWeight: FontWeight.w700, fontSize: 17.0.sp),
          ),
          SizedBox(height: 18.0),
          Text(
            count,
            style: TextStyle(
                color: AppColors.orangeText,
                fontWeight: FontWeight.w600,
                fontFamily: '',
                fontSize: 18.0.sp),
          ),
        ],
      ),
    );
  }
}
