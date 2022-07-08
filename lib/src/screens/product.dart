import 'package:flutter/material.dart';
import 'package:vendease_test/src/utils/colors.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Mhiday',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 14.0),
              Text('What are you looking for today?'),
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
                    SizedBox(height: 21.0),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 36.0, horizontal: 16.0),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 14.0),
                            Text(
                              'Drinks',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 38.0),
              Text(
                'Recent order list',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 190,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.green.withOpacity(0.6),
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
                                            color: AppColors.primaryColor),
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
    );
  }
}
