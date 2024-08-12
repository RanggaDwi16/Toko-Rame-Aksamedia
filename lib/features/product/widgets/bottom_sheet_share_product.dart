import 'package:aksamedia/extension/build_context.ext.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> bottomSheetShareProduct(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          21,
          17,
          21,
          127,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgPicture.asset(Assets.icons.close.path),
                ),
                const Gap(14),
                const Text(
                  'Bagikan Produk',
                  style: TextStyles.textStyle14500,
                ),
              ],
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(16),
              width: context.deviceWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.neutral200,
                    width: 1,
                  ),
                ),
              ),
              child: const Text(
                'Teks dan Link',
                style: TextStyles.textStyle14400,
              ),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.all(16),
              width: context.deviceWidth,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.neutral200,
                    width: 1,
                  ),
                ),
              ),
              child: const Text(
                'Gambar',
                style: TextStyles.textStyle14400
              ),
            ),
            const Gap(16),
          ],
        ),
      );
    },
  );
}
