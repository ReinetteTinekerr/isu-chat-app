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
      duration: const Duration(milliseconds: 800),
      lowerBound: -1,
      upperBound: 1,
    );
    _controller.value = 0;
    _controller.addStatusListener(_updateStatus);

    // _controller.addListener(() {
    //   print('value: ${_controller.value}');
    // });
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
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: AnimatedPageFlipBuilder(
        animation: _controller,
        showFrontSide: _showFrontSide,
        frontBuilder: widget.frontBuilder,
        backBuilder: widget.backBuilder,
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    _controller.value += details.primaryDelta! / screenWidth * 1.5;
    print('c ${_controller.value}');
    if (_controller.value == -1 || _controller.value == 1) {
      _controller.value *= -1;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    print('stop');
    if (_controller.value >= 0.5) {
      _controller.forward();
      print('> 0.5');
      setState(() => _showFrontSide = !_showFrontSide);
    } else if (_controller.value <= -0.5) {
      _controller.reverse();
      print('> -0.5');
      setState(() => _showFrontSide = !_showFrontSide);
    } else {
      print(_controller.value);
      _controller.reverse();
    }
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

  bool get _isAnimationFirstHalf => animation.value.abs() < 0.5;

  double _getTilt() {
    var tilt = (animation.value - 0.5).abs() - 0.5;
    if (animation.value < -0.5) {
      tilt = 1.0 + animation.value;
    }
    return tilt * (_isAnimationFirstHalf ? -0.003 : 0.003);
  }

  double _rotationAngle() {
    final rotationValue = animation.value * pi;
    if (animation.value > 0.5) {
      return pi - rotationValue; // input from 0.5 to 1.0
    } else if (animation.value > -0.5) {
      return rotationValue; // input from -0.5 to 0.5
    } else {
      return -pi - rotationValue; // input from -1.0 to -0.5
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final child = _isAnimationFirstHalf
            ? frontBuilder(context)
            : backBuilder(context);
        return Transform(
          transform: Matrix4.rotationY(_rotationAngle())
            ..setEntry(3, 0, _getTilt()),
          child: child,
          alignment: Alignment.center,
        );
      },
    );
  }
}
