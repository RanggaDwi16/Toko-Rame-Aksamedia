import 'package:aksamedia/extension/build_context.ext.dart';
import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/features/product/widgets/sections/section_button_detail_product_widget.dart';
import 'package:aksamedia/features/product/widgets/sections/section_choose_product_widget.dart';
import 'package:aksamedia/features/product/widgets/sections/section_description_product_widget.dart';
import 'package:aksamedia/features/product/widgets/sections/section_detail_product_widget.dart';
import 'package:aksamedia/features/product/widgets/sections/section_other_product_widget.dart';
import 'package:aksamedia/features/product/widgets/sections/section_simmilar_product_widget.dart';
import 'package:aksamedia/helpers/widgets/carousel_slider_widget.dart';
import 'package:aksamedia/helpers/widgets/custom_indicator_widget.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends ConsumerStatefulWidget {
  final ProductData data;
  const ProductPage({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  late final CarouselSliderController _carouselController;

  final List<Widget> item = [
    Image.asset(
      Assets.images.detailProduct.path,
      fit: BoxFit.fill,
    ),
    Image.asset(
      Assets.images.detailProduct.path,
      fit: BoxFit.fill,
    ),
    Image.asset(
      Assets.images.detailProduct.path,
      fit: BoxFit.fill,
    ),
    Image.asset(
      Assets.images.detailProduct.path,
      fit: BoxFit.fill,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final ProductData data = widget.data;
    return Scaffold(
      body: SizedBox(
        height: context.deviceHeight,
        child: Stack(
          children: [
            Stack(
              children: [
                CarouselSliderWidget(
                  isProductSlider: true,
                  carouselController: _carouselController,
                  items: item,
                  height: context.deviceHeight / 2,
                ),
                Positioned(
                  top: context.deviceHeight / 2.25,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(item.length, (index) {
                      return CustomIndicatorWidget(index: index);
                    }),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: SvgPicture.asset(Assets.icons.arrowLeft.path),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.import.path),
                          const Gap(20),
                          SvgPicture.asset(Assets.icons.shoppingCart.path)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 24),
                height: context.deviceHeight / 1.9,
                width: context.deviceWidth,
                decoration: const BoxDecoration(
                  color: AppColor.neutral,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionDetailProduct(data: data),
                      const Gap(16),
                      SectionChooseProduct(data: data),
                      const Gap(16),
                      const Divider(
                        color: AppColor.neutral200,
                        thickness: 1,
                      ),
                      const Gap(16),
                      SectionDescriptionProduct(data: data),
                      const Gap(16),
                      const Divider(
                        color: AppColor.neutral200,
                        thickness: 1,
                      ),
                      const Gap(16),
                      const SectionOtherProduct(),
                      const Gap(16),
                      const SectionSimmilarProduct(),
                      const Gap(24),
                      const SectionButtonDetailProduct(),
                      const Gap(18),
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
