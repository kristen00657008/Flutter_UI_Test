import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? radius;
  final Function()? onTap;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.color,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: Container(
        padding: padding,
        margin: margin,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: color ?? Colors.black),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
    );
  }
}
