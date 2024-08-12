import 'package:aksamedia/utils/text_style.dart';
import 'package:flutter/material.dart';

class SectionDescription extends StatelessWidget {
  final String description;
  const SectionDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyles.textStyle12400,
    );
  }
}
