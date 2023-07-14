import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? alignText;

  const BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.alignText = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontFamily: "Roboto",
          fontWeight: fontWeight,
          fontSize: size == 0 ? 12.sp : size,
        ),
        textAlign: alignText);
  }
}
