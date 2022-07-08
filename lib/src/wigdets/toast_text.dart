import 'package:flutter/material.dart';

class ToastText extends StatelessWidget {
  final String? text;
  const ToastText({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 64.0),
      decoration: BoxDecoration(
        color: Color(0x99000000),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text!,
        style: TextStyle(fontSize: 13.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
