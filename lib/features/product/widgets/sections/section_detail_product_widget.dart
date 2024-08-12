import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/features/product/widgets/bottom_sheet_share_product.dart';
import 'package:aksamedia/features/product/widgets/price_widget.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionDetailProduct extends StatelessWidget {
  final ProductData data;
  const SectionDetailProduct({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 26,
                  decoration: BoxDecoration(
                    color: AppColor.secondary500,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'NEW ',
                        style: TextStyles.textStyle16700.copyWith(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Product Baru',
                            style: TextStyles.textStyle14400.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bottomSheetShareProduct(context);
                  },
                  child: SvgPicture.asset(Assets.icons.share.path),
                ),
              ],
            ),
            const Gap(14),
            Text(
              data.title,
              style: GoogleFonts.poppins(
                textStyle: TextStyles.textStyle20500,
              ),
            ),
            Text(
              data.company,
              style: TextStyles.textStyle14500.copyWith(
                color: AppColor.primary400,
              ),
            ),
            const Gap(14),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: PriceWidget(
                      price: data.customerPrice,
                      description: 'Harga Customer',
                    ),
                  ),
                  const VerticalDivider(
                    color: AppColor.primary500,
                    thickness: 1,
                  ),
                  Expanded(
                    child: PriceWidget(
                      price: data.resellerPrice,
                      description: 'Harga Reseller',
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.secondary500,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: //span text
                  Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Komisi ',
                    style: TextStyles.textStyle14400.copyWith(
                      color: AppColor.priceComition,
                    ),
                    children: [
                      TextSpan(
                        text: data.commition,
                        style: TextStyles.textStyle16700,
                      ),
                      const TextSpan(
                        text: ' (20%)',
                        style: TextStyles.textStyle14400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
