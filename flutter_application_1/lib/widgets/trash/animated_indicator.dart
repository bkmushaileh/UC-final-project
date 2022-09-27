import 'dart:math';

import 'package:flutter/material.dart';

const blue = Color(0xFF4781ff);

class AnimatedIndicator extends StatefulWidget {
  final Duration duration;
  final double size;
  final VoidCallback callback;

  const AnimatedIndicator(
      {Key? key,
      required this.duration,
      required this.size,
      required this.callback})
      : super(key: key);

  @override
  State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0.0, end: 100.0).animate(controller)
      //Tween(begin: 0.0, end: 20).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          widget.callback();
        }
      });
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: ProgressPainter(animation.value),
          );
        });
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  ProgressPainter(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = blue;
    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = blue;

    final radians = (progress / 100) * 2 * pi;
    _drawShape(canvas, linePaint, circlePaint, -pi / 2, radians, size);
  }

  void _drawShape(Canvas canvas, Paint linePaint, Paint circlePaint,
      double starRadian, double sweepRadian, Size size) {
    final centerX = size.width / 2, centerY = size.height / 2;
    final centerOffset = Offset(centerX, centerY);
    final double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        starRadian, sweepRadian, false, linePaint);

    final x = radius * (1 + sin(sweepRadian)),
        y = radius * (1 - cos(sweepRadian));
    final circleOffset = Offset(x, y);
    canvas.drawCircle(circleOffset, 5, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}
