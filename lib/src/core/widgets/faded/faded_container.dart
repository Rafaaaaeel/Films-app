import 'dart:ui';
import 'package:flutter/material.dart';

class FadedContainer extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const FadedContainer({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
