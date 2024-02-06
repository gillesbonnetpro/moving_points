import 'package:flutter/material.dart';
import 'package:moving_points/point.dart';

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({required this.pointsList});

  List<DataPoint> pointsList;

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    canvas.drawLine(
      const Offset(0, 20),
      Offset(size.width, 50),
      paintLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
