import 'package:aksamedia/features/product/widgets/item_grid_product_widget.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SectionOtherProduct extends StatelessWidget {
  final bool showNewIcon;

  const SectionOtherProduct({
    super.key,
    this.showNewIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Produk lain dari Irvie group official',
            style: TextStyles.textStyle16500,
          ),
          const Gap(16),
          SizedBox(
            height: 274,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                bool showNewIcon = (index == 1);
                return Row(
                  children: [
                    ItemGridProduct(showNewIcon: showNewIcon),
                    const Gap(20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
