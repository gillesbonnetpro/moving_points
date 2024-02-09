import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';
import 'dart:ui' as ui;

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({required this.pointsList}) {
    print('customPaint a une liste de ${pointsList.length} éléments');
  }

  List<DataPoint> pointsList;

  @override
  void paint(Canvas canvas, Size size) {
    for (DataPoint data in pointsList) {
      if (data != pointsList.last) {
        int next = pointsList.indexOf(data) + 1;
        DataPoint data2 = pointsList[next];

        Offset offset1 = Offset(data.x, data.y);
        Offset offset2 = Offset(data2.x, data2.y);

        final paintLine = Paint()
          ..shader =
              ui.Gradient.linear(offset1, offset2, [data.color, data2.color])
          ..strokeWidth = 4
          ..style = PaintingStyle.fill;

        canvas.drawLine(
          offset1,
          offset2,
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
