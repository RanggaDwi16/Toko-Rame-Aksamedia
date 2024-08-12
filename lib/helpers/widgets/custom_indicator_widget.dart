import 'package:aksamedia/features/home/providers/index_provider.dart';
import 'package:aksamedia/features/product/providers/index_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomIndicatorWidget extends ConsumerWidget {
  final bool product;
  final int index;

  const CustomIndicatorWidget({
    super.key,
    required this.index,
    this.product = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final currentIndexImage = ref.watch(currentIndexImageProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: (product ? currentIndexImage == index : currentIndex == index) ? 20.0 : 4.0,
      height: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: (product ? currentIndexImage == index : currentIndex == index)
            ? BorderRadius.circular(16.0)
            : BorderRadius.circular(50.0),
        color: Colors.white,
      ),
    );
  }
}
