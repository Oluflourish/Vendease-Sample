import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/utils/app_images.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child:
                        SvgPicture.asset(SvgIcons.chevronRight, height: 16.0),
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    'Your cart',
                    style: TextStyle(
                      color: AppColors.blackText.withOpacity(0.9),
                      fontSize: 22.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '3 items',
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 20.0),
            Container(
              // padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var titles = ['Watermelon', 'Pineapples', 'Catfish'];

                    var images = [
                      AppImages.watermelon,
                      AppImages.pineapple,
                      AppImages.catfish
                    ];
                    return Container(
                      width: 130,
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 16.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          Image(
                            height: 70.0,
                            width: 85.0,
                            image: AssetImage(images[index]),
                          ),
                          SizedBox(width: 36.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                      color:
                                          AppColors.blackText.withOpacity(0.8),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '1 crate',
                                  style: TextStyle(
                                    color: AppColors.black.withOpacity(0.5),
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '₦ 1,100',
                                  style: TextStyle(
                                    color: AppColors.greyText,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 36.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(SvgIcons.delete),
                              SizedBox(height: 36.0),
                              Row(
                                children: [
                                  SvgPicture.asset(SvgIcons.subtract),
                                  SizedBox(width: 14.0),
                                  Text('6',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 14.0),
                                  SvgPicture.asset(SvgIcons.add),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 38.0),
          ],
        ),
      ),
    );
  }
}
