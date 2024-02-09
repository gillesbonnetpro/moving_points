import 'package:flutter/material.dart';

import 'data_point.dart';

class MovingPoint extends StatefulWidget {
  MovingPoint(
      {super.key,
      required this.data,
      required this.onMove,
      required this.onRelease});

  DataPoint data;
  Function(double, double) onMove;
  Function() onRelease;

  @override
  State<MovingPoint> createState() => _MovingPointState();
}

class _MovingPointState extends State<MovingPoint> {
  double pointSize = 30;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.data.x - (pointSize / 2),
      top: widget.data.y - (pointSize / 2),
      child: SizedBox(
        height: pointSize,
        width: pointSize,
        child: GestureDetector(
          onPanUpdate: (details) {
            double newX = widget.data.x + details.delta.dx;
            double newY = widget.data.y + details.delta.dy;

            if (newX < pointSize) {
              newX = pointSize;
            }

            if (newX > (MediaQuery.of(context).size.width - pointSize)) {
              newX = MediaQuery.of(context).size.width - pointSize;
            }

            if (newY < pointSize) {
              newY = pointSize;
            }

            if (newY > (MediaQuery.of(context).size.height - 2 * pointSize)) {
              newY = (MediaQuery.of(context).size.height - 2 * pointSize);
            }

            widget.onMove(newX, newY);
          },
          onPanEnd: (details) {
            widget.onRelease();
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.data.color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
