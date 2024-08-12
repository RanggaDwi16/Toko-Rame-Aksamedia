import 'package:aksamedia/features/home/providers/index_provider.dart';
import 'package:aksamedia/features/product/providers/index_image_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarouselSliderWidget extends ConsumerWidget {
  final CarouselSliderController carouselController;
  final List<Widget> items;
  final double height;
  final bool isProductSlider;

  const CarouselSliderWidget({
    super.key,
    required this.carouselController,
    required this.items,
    required this.height,
    this.isProductSlider = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialPage = isProductSlider
        ? ref.watch(currentIndexImageProvider)
        : ref.watch(currentIndexProvider);

    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        viewportFraction: 1,
        height: height,
        initialPage: initialPage,
        aspectRatio: 16 / 9,
        onPageChanged: (index, reason) {
          if (isProductSlider) {
            ref.read(currentIndexImageProvider.notifier).state = index;
          } else {
            ref.read(currentIndexProvider.notifier).state = index;
          }
        },
      ),
      carouselController: carouselController,
    );
  }
}
