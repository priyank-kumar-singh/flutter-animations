import 'package:flutter/material.dart';

import 'painter.dart';

class InfinityLoopAnim extends StatefulWidget {
  final Offset? centerRef;
  final double xShift;
  final double yShift;

  final Color? backgroundColor;

  final Color? ballColor;
  final double? ballSize;

  final Color? pathColor;
  final double? pathSize;

  /// `Duration` in seconds
  final int? duration;

  const InfinityLoopAnim({
    Key? key,
    this.xShift = 1.0,
    this.yShift = 0.5,
    this.centerRef,
    this.backgroundColor,
    this.ballColor,
    this.ballSize,
    this.pathColor,
    this.pathSize,
    this.duration,
  }) : super(key: key);

  @override
  State<InfinityLoopAnim> createState() => _InfinityLoopAnimState();
}

class _InfinityLoopAnimState extends State<InfinityLoopAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Path path;

  late double ballSize;
  late double pathSize;
  late int speed;

  @override
  void initState() {
    super.initState();

    ballSize = widget.ballSize ?? 11.0;
    pathSize = widget.pathSize ?? 24.0;
    speed = (widget.duration ?? 2) * 1000;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: speed),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Colors.yellow.shade700,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _setPath(constraints);
          return Stack(
            children: [
              CustomPaint(
                painter: InfinityLoopAnimPathPainter(
                  path,
                  pathColor: widget.pathColor ?? Colors.yellow,
                  pathSize: widget.pathSize ?? 24.0,
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (_, __) {
                  return CustomPaint(
                    painter: InfinityLoopAnimBallPainter(
                      path,
                      value: _animation.value,
                      ballColor: widget.ballColor ?? Colors.red,
                      ballSize: widget.ballSize ?? 11.0,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _setPath(BoxConstraints constraints) {
    var center = widget.centerRef ??
        Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
    path = Path()
      ..moveTo(center.dx, center.dy)
      ..cubicTo(
        center.dx + center.dx * widget.xShift,
        center.dy + center.dy * widget.yShift,
        center.dx + center.dx * widget.xShift,
        center.dy - center.dy * widget.yShift,
        center.dx,
        center.dy,
      )
      ..cubicTo(
        center.dx - center.dx * widget.xShift,
        center.dy + center.dy * widget.yShift,
        center.dx - center.dx * widget.xShift,
        center.dy - center.dy * widget.yShift,
        center.dx,
        center.dy,
      )
      ..close();
  }
}
