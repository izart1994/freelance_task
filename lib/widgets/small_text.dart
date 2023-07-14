import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final double? height;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 0,
    this.height = 1.4,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: "Roboto",
        fontWeight: fontWeight,
        fontSize: size == 0 ? 12.sp : size,
        height: height,
      ),
    );
  }
}
