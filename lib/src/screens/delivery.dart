import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgIcons.delivery,
                width: 128,
              ),
              SizedBox(height: 16.0),
              Text(
                'Delivery',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
