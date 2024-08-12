import 'package:aksamedia/features/product/widgets/button_detail_product_widget.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:flutter/material.dart';

class SectionButtonDetailProduct extends StatelessWidget {
  const SectionButtonDetailProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonDetailProduct(
            title: 'Tambahkan ke toko',
            width: 239,
            height: 40,
            borderColor: AppColor.primary950,
            backgroundColor: Colors.transparent,
            textColor: AppColor.primary950,
            onTap: () {},
          ),
          ButtonDetailProduct(
            width: 90,
            height: 40,
            borderColor: AppColor.primary950,
            backgroundColor: AppColor.primary950,
            textColor: Colors.white,
            onTap: () {},
            isIcon: true,
          ),
        ],
      ),
    );
  }
}
