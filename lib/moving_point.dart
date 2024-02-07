import 'package:flutter/material.dart';

import 'data_point.dart';

class MovingPoint extends StatefulWidget {
  MovingPoint({super.key, required this.data, required this.onMove});

  DataPoint data;
  Function(double, double) onMove;

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
            double newX = widget.data.x;
            double newY = widget.data.y;
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              newX = widget.data.x + details.delta.dx;
              print('vers la droite $newX');
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              newX = widget.data.x + details.delta.dx;
              print('vers la gauche $newX');
            }

            // Swiping in bottom direction.
            if (details.delta.dy > 0) {
              newY = widget.data.y + details.delta.dy;
              print('vers le bas $newY');
            }

            // Swiping in up direction.
            if (details.delta.dy < 0) {
              newY = widget.data.y + details.delta.dy;
              print('vers le haut $newY');
            }

            widget.onMove(newX, newY);
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
