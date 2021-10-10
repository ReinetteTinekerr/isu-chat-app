// Note: there's no underscore here as we want this State subclass to be public.
// This is so that we can call the flip() method from the outside.
import 'dart:math';

import 'package:flutter/material.dart';

class PageFlipBuilder extends StatefulWidget {
  const PageFlipBuilder({
    Key? key,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(key: key);
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _controller.addStatusListener(_updateStatus);

    _controller.addListener(() {
      print('value: ${_controller.value}');
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() => _showFrontSide = !_showFrontSide);
    }
  }

  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuilder(
      animation: _controller,
      showFrontSide: _showFrontSide,
      frontBuilder: widget.frontBuilder,
      backBuilder: widget.backBuilder,
    );
  }
}

class AnimatedPageFlipBuilder extends StatelessWidget {
  const AnimatedPageFlipBuilder({
    Key? key,
    required this.animation,
    required this.showFrontSide,
    required this.frontBuilder,
    required this.backBuilder,
  }) : super(key: key);
  final Animation<double> animation;
  final bool showFrontSide; // we'll see how to use this later
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        // this boolean tells us if we're on the first or second half of the animation
        final isAnimationFirstHalf = animation.value.abs() < 0.5;
        // decide which page we need to show
        final child =
            isAnimationFirstHalf ? frontBuilder(context) : backBuilder(context);
        // map values between [0, 1] to values between [0, pi]
        final rotationValue = animation.value * pi;
        // calculate the correct rotation angle depening on which page we need to show
        final rotationAngle =
            animation.value > 0.5 ? pi - rotationValue : rotationValue;
        return Transform(
          transform: Matrix4.rotationY(rotationAngle),
          child: child,
          alignment: Alignment.center,
        );
      },
    );
  }
}
