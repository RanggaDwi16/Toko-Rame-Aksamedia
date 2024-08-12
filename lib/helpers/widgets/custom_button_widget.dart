import 'package:aksamedia/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final double height;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 40,
    required this.borderRadius,
    this.textStyle = const TextStyle(
      color: AppColor.primary50,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary950,
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: height,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
