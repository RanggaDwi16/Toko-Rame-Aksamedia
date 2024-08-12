import 'package:aksamedia/extension/build_context.ext.dart';
import 'package:aksamedia/features/home/data/slide_data.dart';
import 'package:aksamedia/features/home/providers/index_provider.dart';
import 'package:aksamedia/features/product/data/product_data.dart';
import 'package:aksamedia/helpers/widgets/carousel_slider_widget.dart';
import 'package:aksamedia/features/home/widgets/section_description_widget.dart';
import 'package:aksamedia/features/home/widgets/section_title_widget.dart';
import 'package:aksamedia/helpers/widgets/custom_button_widget.dart';
import 'package:aksamedia/helpers/widgets/custom_indicator_widget.dart';
import 'package:aksamedia/routes/router_name.dart';
import 'package:aksamedia/utils/app_color.dart';
import 'package:aksamedia/utils/assets.gen.dart';
import 'package:aksamedia/utils/text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final CarouselSliderController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
  }

  void nextSlide() {
    final currentIndex = ref.read(currentIndexProvider);
    if (currentIndex < 2) {
      _carouselController.nextPage();
      ref.read(currentIndexProvider.notifier).state++;
    } else {
      context.pushNamed(RouteName.product, extra: const ProductData());
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: SizedBox(
        height: context.deviceHeight,
        child: Stack(
          children: [
            Stack(
              children: [
                CarouselSliderWidget(
                  isProductSlider: false,
                  carouselController: _carouselController,
                  height: context.deviceHeight / 1.5,
                  items: [
                    Image.asset(
                      Assets.images.slide1.path,
                      width: context.deviceWidth,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      Assets.images.slide2.path,
                      width: context.deviceWidth,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      Assets.images.slide3.path,
                      width: context.deviceWidth,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return CustomIndicatorWidget(
                        index: index,
                        product: false,
                      );
                    }),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: TextButton(
                    onPressed: () => context.pushNamed(RouteName.product,
                        extra: const ProductData()),
                    child: Text('Lewati',
                        style: TextStyles.textStyle16500
                            .copyWith(color: AppColor.primary800)),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: context.deviceHeight / 2.8,
                width: context.deviceWidth,
                decoration: const BoxDecoration(
                  color: AppColor.neutral,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 34),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SectionTitle(title: titles[currentIndex]),
                            const Gap(18),
                            SectionDescription(
                                description: descriptions[currentIndex]),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 0,
                        right: 0,
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(10),
                          height: 40,
                          title: 'Selanjutnya',
                          onPressed: nextSlide,
                        ),
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
