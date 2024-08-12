import 'package:aksamedia/features/product/widgets/bottom_sheet_share_product.dart';
import 'package:aksamedia/helpers/widgets/custom_button_widget.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ItemGridProduct extends StatelessWidget {
  const ItemGridProduct({
    super.key,
    required this.showNewIcon,
  });

  final bool showNewIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 274,
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                child: Image.asset(
                  Assets.images.detailProduct.path,
                ),
              ),
              if (showNewIcon)
                Positioned(
                  top: 0,
                  right: 7,
                  child: SvgPicture.asset(Assets.icons.newTage.path),
                ),
              Positioned(
                bottom: 6,
                left: 6,
                child: Container(
                  height: 22,
                  width: 76,
                  decoration: const BoxDecoration(
                    //color 80%
                    color: Color.fromRGBO(14, 165, 233, 0.8),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: '30%',
                        style: TextStyles.textStyle10500.copyWith(
                          color: AppColor.neutral,
                        ),
                        children: [
                          TextSpan(
                            text: ' Komisi',
                            style: TextStyles.textStyle10400.copyWith(
                              color: AppColor.neutral,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Gap(6),
          const Text('Beauty Set by Irvie', style: TextStyles.textStyle12500),
          const Gap(8),
          Text(
            'Harga reseller',
            style: TextStyles.textStyle10400.copyWith(
              color: AppColor.primary500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp142.400',
                style: TextStyles.textStyle14700.copyWith(
                  color: AppColor.success600,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.archive.path),
                  const Gap(4),
                  Text(
                    '99+ pcs',
                    style: TextStyles.textStyle10400.copyWith(
                      color: AppColor.primary500,
                    ),
                  )
                ],
              )
            ],
          ),
          const Gap(6),
          CustomButton(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            onPressed: () {
              bottomSheetShareProduct(context);
            },
            title: 'Bagikan Produk',
            textStyle: TextStyles.textStyle14400.copyWith(
              color: AppColor.neutral200,
            ),
          ),
        ],
      ),
    );
  }
}
