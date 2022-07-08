import 'package:flutter/material.dart';
import 'package:vendease_test/src/utils/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.title,
      this.onTap,
      this.isFilled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.color = AppColors.primaryColor,
      this.textColor = AppColors.white,
      this.borderColor = AppColors.transparent,
      this.borderRadius = 8.0,
      this.height = 50.0});

  final VoidCallback? onTap;
  final title;
  final bool isFilled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: isFilled ? color : AppColors.white,
            border: Border.all(color: borderColor, width: 1.0),
          ),
          child: Stack(
            children: [
              prefixIcon != null
                  ? Container(
                      alignment: Alignment.centerLeft,
                      child: prefixIcon,
                    )
                  : Container(),
              Center(
                child: title is String
                    ? Text(
                        title ?? "",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            color: textColor,
                            fontWeight: FontWeight.w700),
                      )
                    : title,
              ),
              suffixIcon != null
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: suffixIcon,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
