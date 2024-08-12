import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonDetailProduct extends StatelessWidget {
  final String? title;
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Function() onTap;
  final bool isIcon;

  const ButtonDetailProduct({
    super.key,
    this.title,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: isIcon
              ? SvgPicture.asset(Assets.icons.shoppingCart.path)
              : Text(
                  title ?? '',
                  style: TextStyles.textStyle14500.copyWith(
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
