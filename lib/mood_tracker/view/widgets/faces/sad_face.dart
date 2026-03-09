import 'dart:math' as math;
import 'package:flutter/material.dart';

class SadFacePainter extends CustomPainter {
  const SadFacePainter({this.color = Colors.black87});

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
    final eyeRadius = width * 0.08;
    final eyeYOffset = height * 0.45;
    final eyeXOffset = width * 0.2;

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

    // Eyebrows (Slanted)
    final browYOffset = height * 0.3;
    final browLength = width * 0.15;
    final browSlant = height * 0.05;

    canvas
      ..drawLine(
        Offset(
          width / 2 - eyeXOffset - browLength / 2,
          browYOffset + browSlant,
        ),
        Offset(
          width / 2 - eyeXOffset + browLength / 2,
          browYOffset - browSlant,
        ),
        strokePaint,
      )
      ..drawLine(
        Offset(
          width / 2 + eyeXOffset - browLength / 2,
          browYOffset - browSlant,
        ),
        Offset(
          width / 2 + eyeXOffset + browLength / 2,
          browYOffset + browSlant,
        ),
        strokePaint,
      );

    // Mouth (Sad Arc)
    final mouthRect = Rect.fromCenter(
      center: Offset(width / 2, height * 0.75),
      width: width * 0.4,
      height: height * 0.2,
    );

    canvas.drawArc(
      mouthRect,
      math.pi,
      math.pi,
      false,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant SadFacePainter oldDelegate) =>
      color != oldDelegate.color;
}

class SadFace extends StatelessWidget {
  const SadFace({
    super.key,
    this.color = Colors.black87,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SadFacePainter(color: color),
    );
  }
}
