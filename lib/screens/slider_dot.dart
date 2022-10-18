import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderDot extends StatelessWidget {
  bool isActive = false;
  // ignore: use_key_in_widget_constructors
  SliderDot(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: isActive ? 12 : 5,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
