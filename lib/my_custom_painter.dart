import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({required this.pointsList}) {
    print('customPaint a une liste de ${pointsList.length} éléments');
  }

  List<DataPoint> pointsList;

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    for (DataPoint data in pointsList) {
      if (data != pointsList.last) {
        int next = pointsList.indexOf(data) + 1;
        canvas.drawLine(
          Offset(data.x, data.y),
          Offset(pointsList[next].x, pointsList[next].y),
          paintLine,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
