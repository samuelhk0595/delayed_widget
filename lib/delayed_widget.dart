library delayed_widget;

import 'package:flutter/material.dart';

enum DelayedAnimations {
  SLIDE_FROM_LEFT,
  SLIDE_FROM_RIGHT,
  SLIDE_FROM_TOP,
  SLIDE_FROM_BOTTOM,
}

class DelayedWidget extends StatefulWidget {
  DelayedWidget({
    Key key,
    @required this.child,
    this.animationDuration,
    this.delayDuration,
    this.animation = DelayedAnimations.SLIDE_FROM_RIGHT,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final Duration delayDuration;
  final Duration animationDuration;
  final DelayedAnimations animation;
  final bool enabled;

  @override
  _DelayedWidgetState createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: widget.animationDuration ?? Duration(milliseconds: 300),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(widget.delayDuration ?? Duration(seconds: 0));
      if (widget.enabled) animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _offset(),
          child: Opacity(opacity: 1.0 - (animation.value), child: widget.child),
        );
      },
    );
  }

  Offset _offset() {
    double extent = 30.0;

    switch (widget.animation) {
      case DelayedAnimations.SLIDE_FROM_LEFT:
        extent = extent - (extent * 2);

        return Offset(extent * animation.value, 0.0);

      case DelayedAnimations.SLIDE_FROM_RIGHT:
        return Offset(extent * animation.value, 0.0);

      case DelayedAnimations.SLIDE_FROM_TOP:
        extent = extent - (extent * 2);

        return Offset(0.0, extent * animation.value);

      case DelayedAnimations.SLIDE_FROM_BOTTOM:
        return Offset(0.0, extent * animation.value);
    }
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }
}
