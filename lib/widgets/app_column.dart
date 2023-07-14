import 'package:flutter/material.dart';
import 'package:freelance_task/widgets/big_text.dart';
import 'package:freelance_task/widgets/icon_and_text.dart';
import 'package:freelance_task/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class AppColumn extends StatelessWidget {
  final String title;
  final double? rating;
  final int? comments;
  final double? titleSize;

  const AppColumn({Key? key, required this.title, this.rating = 0, this.comments = 0, this.titleSize = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: title,
          size: titleSize,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                rating?.toInt() ?? 0,
                (index) => Icon(
                  Icons.star,
                  size: 15.h,
                ),
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            SmallText(text: rating.toString()),
            SizedBox(width: 5),
            SmallText(text: "${comments.toString()} comments"),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
              icon: Icons.circle_sharp,
              text: "normal",
              iconColor: Colors.amber,
            ),
            IconAndText(
              icon: Icons.location_on,
              text: "17km",
              iconColor: Colors.amber,
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              text: "45min",
              iconColor: Colors.amber,
            ),
          ],
        ),
      ],
    );
  }
}
