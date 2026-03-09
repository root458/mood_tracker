import 'package:flutter/material.dart';

class NeutralFacePainter extends CustomPainter {
  const NeutralFacePainter({this.color = Colors.black87});

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
      ..strokeWidth = size.width * 0.05
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
    final eyeYOffset = height * 0.35;
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

    // Mouth (Straight Line)
    final mouthYOffset = height * 0.65;
    final mouthWidth = width * 0.4;

    canvas.drawLine(
      Offset(width / 2 - mouthWidth / 2, mouthYOffset),
      Offset(width / 2 + mouthWidth / 2, mouthYOffset),
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant NeutralFacePainter oldDelegate) =>
      color != oldDelegate.color;
}

class NeutralFace extends StatelessWidget {
  const NeutralFace({
    super.key,
    this.color = Colors.black87,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeutralFacePainter(color: color),
    );
  }
}
