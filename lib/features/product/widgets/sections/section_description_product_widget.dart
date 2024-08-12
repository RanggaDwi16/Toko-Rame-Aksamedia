import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SectionDescriptionProduct extends StatelessWidget {
  final ProductData data;
  const SectionDescriptionProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Deskripsi', style: TextStyles.textStyle16500),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: data.description))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Deskripsi disalin ke clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  });
                },
                child: SvgPicture.asset(Assets.icons.documentCopy.path),
              ),
            ],
          ),
          const Gap(16),
          Text(
            data.description,
            style: TextStyles.textStyle14400,
          ),
          const Gap(16),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selengkapnya',
                  style: TextStyles.textStyle14500.copyWith(
                    color: AppColor.info500,
                  ),
                ),
                const Gap(8),
                SvgPicture.asset(Assets.icons.arrowDown.path)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
