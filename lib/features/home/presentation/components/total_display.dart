import 'package:flutter/material.dart';
import 'package:teatally/core/app_colors.dart';
import 'package:teatally/core/styles/text/txt.dart';

class TotalDisplay extends StatelessWidget {
  const TotalDisplay({
    super.key,
    required this.total,
  });
  final int total;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.lightGreen, borderRadius: BorderRadius.circular(22)),
      child: RichText(
          text: TextSpan(children: [
        txtSpan(
          context,
          text: 'Total: ',
          style: TxtStyle.bodyLRegular,
        ),
        txtSpan(
          context,
          text: total.toString(),
          style: TxtStyle.bodyLBold,
        )
      ])),
    );
  }
}
