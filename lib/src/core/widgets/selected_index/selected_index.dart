import 'package:flutter/material.dart';

class SelectedIndex extends StatelessWidget {
  final int selected;
  final int numberTotalOfIndexes;

  const SelectedIndex({
    required this.numberTotalOfIndexes,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numberTotalOfIndexes,
        (index) => CircleWiget(
          isSelected: index == selected,
        ),
      ),
    );
  }
}

class CircleWiget extends StatelessWidget {
  final bool isSelected;

  const CircleWiget({required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Colors.white
              : const Color.fromARGB(132, 158, 158, 158),
        ),
      ),
    );
  }
}
