import 'dart:math' as math;
import 'package:flutter/material.dart';

class HappyFacePainter extends CustomPainter {
  const HappyFacePainter({this.color = Colors.black87});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;

    // Face outline
    final radius = width / 2 - strokePaint.strokeWidth / 2;
    canvas.drawCircle(
      Offset(width / 2, height / 2),
      radius,
      strokePaint,
    );

    // Eyes
    final eyeRadius = width * 0.1;
    final eyeYOffset = height * 0.35;
    final eyeXOffset = width * 0.25;

    canvas
      ..drawCircle(
        Offset(width / 2 - eyeXOffset, eyeYOffset),
        eyeRadius,
        paint,
      )
      ..drawCircle(
        Offset(width / 2 + eyeXOffset, eyeYOffset),
        eyeRadius,
        paint,
      );

    // Mouth (Smile Arc)
    final mouthRect = Rect.fromCenter(
      center: Offset(width / 2, height * 0.55),
      width: width * 0.6,
      height: height * 0.35,
    );

    canvas.drawArc(
      mouthRect,
      0,
      math.pi,
      false,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant HappyFacePainter oldDelegate) =>
      color != oldDelegate.color;
}

class HappyFace extends StatelessWidget {
  const HappyFace({
    super.key,
    this.color = Colors.black87,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HappyFacePainter(color: color),
    );
  }
}
