import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
    this.isIcon = false,
    this.text = "Hi",
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 1.0),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
                size: 15,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
                size: 22,
              ),
            ),
    );
  }
}
