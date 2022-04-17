import 'package:flutter/material.dart';

import '../../util/util.dart';
import 'painter.dart';

class InfiniteLoopAnim extends StatefulWidget {
  /// Point of reference to be used as center
  ///
  /// Defaults to center of the screen.
  final Offset? centerRef;

  /// Shift factor to be used to stretch loop in the X-axis.
  final double xShift;

  /// Shift factor to be used to stretch loop in the Y-axis.
  final double yShift;

  final Color? backgroundColor;

  final Color? ballColor;
  final double ballSize;

  final Color? pathColor;
  final double pathSize;

  /// `Speed` in milliseconds per round.
  final int speed;

  const InfiniteLoopAnim({
    Key? key,
    this.xShift = 1.0,
    this.yShift = 0.5,
    this.centerRef,
    this.backgroundColor,
    this.ballColor,
    this.ballSize = 11.0,
    this.pathColor,
    this.pathSize = 24.0,
    this.speed = 2000,
  }) : super(key: key);

  @override
  State<InfiniteLoopAnim> createState() => _InfiniteLoopAnimState();
}

class _InfiniteLoopAnimState extends State<InfiniteLoopAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Path path;

  late double ballSize;
  late double pathSize;
  late int speed;
  late double xShift;
  late double yShift;

  @override
  void initState() {
    super.initState();
    xShift = widget.xShift;
    yShift = widget.yShift;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.speed),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Infinite Loop',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: widget.backgroundColor ?? Colors.yellow.shade700,
      body: ResponsiveLayoutBuilder(
        small: (_, child) => child!,
        medium: (_, child) => child!,
        large: (_, child) => child!,
        child: (size) {
          if (size == LayoutSize.large) {
            xShift = widget.xShift * 0.3;
          } else if (size == LayoutSize.medium) {
            xShift = widget.xShift * 0.5;
          } else {
            xShift = widget.xShift * 1.0;
          }
          return buildAnimation(context);
        },
      ),
    );
  }

  Widget buildAnimation(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        setPath(constraints);
        return Stack(
          children: [
            CustomPaint(
              painter: InfiniteLoopAnimPathPainter(
                path,
                pathColor: widget.pathColor ?? Colors.yellow,
                pathSize: widget.pathSize,
              ),
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (_, __) {
                return CustomPaint(
                  painter: InfiniteLoopAnimBallPainter(
                    path,
                    value: animation.value,
                    ballColor: widget.ballColor ?? Colors.red,
                    ballSize: widget.ballSize,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void setPath(BoxConstraints constraints) {
    var center = widget.centerRef ??
        Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
    path = Path()
      ..moveTo(center.dx, center.dy)
      ..cubicTo(
        center.dx + center.dx * xShift,
        center.dy + center.dy * yShift,
        center.dx + center.dx * xShift,
        center.dy - center.dy * yShift,
        center.dx,
        center.dy,
      )
      ..cubicTo(
        center.dx - center.dx * xShift,
        center.dy + center.dy * yShift,
        center.dx - center.dx * xShift,
        center.dy - center.dy * yShift,
        center.dx,
        center.dy,
      )
      ..close();
  }
}
