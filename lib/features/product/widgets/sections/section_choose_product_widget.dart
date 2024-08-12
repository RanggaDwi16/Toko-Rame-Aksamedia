import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/features/product/providers/state_provider.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SectionChooseProduct extends ConsumerWidget {
  final ProductData data;
  const SectionChooseProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPackage = ref.watch(selectedPackageProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.neutral,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.neutral200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ukuran',
                style: TextStyles.textStyle14400.copyWith(
                  color: AppColor.primary950,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        ref.read(selectedPackageProvider.notifier).state = 0,
                    child: Container(
                      height: 27,
                      width: 97,
                      decoration: BoxDecoration(
                        color: AppColor.primary100,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: selectedPackage == 0 ? 2 : 0,
                          color: AppColor.primary950,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Paket 1',
                          style: TextStyles.textStyle14400.copyWith(
                            color: AppColor.primary950,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(13),
                  GestureDetector(
                    onTap: () =>
                        ref.read(selectedPackageProvider.notifier).state = 1,
                    child: Container(
                      height: 27,
                      width: 97,
                      decoration: BoxDecoration(
                        color: AppColor.primary100,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: selectedPackage == 1 ? 2 : 0,
                          color: AppColor.primary950,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Paket 2',
                          style: TextStyles.textStyle14400.copyWith(
                            color: AppColor.primary950,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(14),
              Text(
                'Warna',
                style: TextStyles.textStyle14400.copyWith(
                  color: AppColor.primary950,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        ref.read(selectedColorProvider.notifier).state = 0,
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppColor.color1,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: selectedColor == 0 ? 2 : 0,
                          color: AppColor.primary950,
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  GestureDetector(
                    onTap: () =>
                        ref.read(selectedColorProvider.notifier).state = 1,
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppColor.color2,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: selectedColor == 1 ? 2 : 0,
                          color: AppColor.primary950,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(14),
              RichText(
                  text: TextSpan(
                text: 'Stok: ',
                style: TextStyles.textStyle14400.copyWith(
                  color: AppColor.primary950,
                ),
                children:  [
                  TextSpan(
                    text: data.stock,
                    style: TextStyles.textStyle16700,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
