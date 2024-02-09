import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'dart:core';

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({required this.pointsList}) {
    print('customPaint a une liste de ${pointsList.length} éléments');
  }

  List<DataPoint> pointsList;

  @override
  void paint(Canvas canvas, Size size) {
    for (DataPoint data in pointsList) {
      if (data != pointsList.last) {
        Offset offset1 = Offset(data.x, data.y);

        for (int i = (pointsList.indexOf(data) + 1);
            i < pointsList.length;
            i++) {
          DataPoint data2 = pointsList[i];
          Offset offset2 = Offset(data2.x, data2.y);
          double distX = (offset1.dx + offset2.dx) / 2;
          double distY = (offset1.dy + offset2.dy);
          print('X : ${offset1.dx} / ${offset2.dx} / $distX');
          print('Y : ${offset1.dy} / ${offset2.dy} / $distY');
          final paintLine = Paint()
            ..shader =
                ui.Gradient.linear(offset1, offset2, [data.color, data2.color])
            ..strokeWidth = 4
            ..style = PaintingStyle.stroke;

          Path path = Path();
          path.moveTo(offset1.dx, offset1.dy);
          path.quadraticBezierTo(distX, distY, offset2.dx, offset2.dy);

          //canvas.drawCircle(Offset(distX, distY), 20, paintLine);

          canvas.drawPath(path, paintLine);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
