import 'package:flutter/material.dart';
import 'package:vendease_test/src/utils/app_fonts.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/helpers.dart';

class Naira extends StatelessWidget {
  num value;
  TextStyle? style;
  TextStyle? nairaStyle;
  bool hasDecimal;
  bool isNegative;

  Naira(
    this.value, {
    this.style =
        const TextStyle(fontFamily: AppFonts.gilroy, color: AppColors.black),
    this.nairaStyle,
    this.hasDecimal = false,
    this.isNegative = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // '\u{20A6}' == '₦'

    if (value < 0) {
      value *= -1;
      isNegative = true;
    }

    return RichText(
      text: TextSpan(
        text: '',
        style: style,
        children: <TextSpan>[
          TextSpan(
            text: isNegative ? '- ₦ ' : '₦ ',
            style: nairaStyle != null
                ? nairaStyle!.copyWith(fontFamily: '')
                : style!.copyWith(fontFamily: ''),
          ),
          TextSpan(text: '${currencyFormatter(value, hasDecimal: hasDecimal)}'),
        ],
      ),
    );
  }
}
