import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedFlippingIcon extends StatefulWidget {
  final AnimationController controller;
  final double width;
  final double height;
  final String imageUrl;

  const AnimatedFlippingIcon(
      {super.key,
      required this.controller,
      required this.width,
      required this.height,
      required this.imageUrl});

  @override
  State<AnimatedFlippingIcon> createState() => _AnimatedFlippingIconState();
}

class _AnimatedFlippingIconState extends State<AnimatedFlippingIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(0.0, 0.5, curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: AnimatedBuilder(
            animation: widget.controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateY(2 * pi * animation.value),
                alignment: Alignment.center,
                child: Image.asset(widget.imageUrl),
              );
            }));
  }
}
