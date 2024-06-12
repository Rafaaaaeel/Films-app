import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      );
}
