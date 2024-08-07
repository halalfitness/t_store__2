import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TGreyText extends StatelessWidget {
  const TGreyText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Text(text,
        style: TextStyle(
            color: dark ? TColors.grey : TColors.darkerGrey,
            fontSize: 20,
            fontWeight: FontWeight.w400));
  }
}
