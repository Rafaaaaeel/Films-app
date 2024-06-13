import 'package:article_app/src/core/shared/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class VerticalSafeSpace extends StatelessWidget {
  const VerticalSafeSpace({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: safePadding);
  }
}
