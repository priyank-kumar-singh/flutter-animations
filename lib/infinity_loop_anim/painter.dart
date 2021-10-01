import 'package:flutter/material.dart';

class InfinityLoopAnimPathPainter extends CustomPainter {
  late final Paint _brush;

  final Path path;
  final Color? pathColor;
  final double? pathSize;

  InfinityLoopAnimPathPainter(
    this.path, {
    this.pathSize,
    this.pathColor,
  }) {
    _brush = Paint()
      ..color = pathColor ?? Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = pathSize ?? 24.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, _brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InfinityLoopAnimBallPainter extends CustomPainter {
  late final Paint _brush;

  final Path path;
  final double value;
  final Color? ballColor;
  final double? ballSize;

  InfinityLoopAnimBallPainter(
    this.path, {
    required this.value,
    this.ballSize,
    this.ballColor,
  }) {
    _brush = Paint()
      ..color = ballColor ?? Colors.red
      ..style = PaintingStyle.fill;
  }

  Offset getBallLocation() {
    var pathMetric = path.computeMetrics().elementAt(0);
    var value = pathMetric.length * this.value;
    var pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(getBallLocation(), ballSize ?? 11.0, _brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
