import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String description;
  const PriceWidget({
    super.key,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          price,
          style: TextStyles.textStyle16700,
        ),
        Text(
          description,
          style: TextStyles.textStyle14500.copyWith(
            color: AppColor.primary500,
          ),
        ),
      ],
    );
  }
}
