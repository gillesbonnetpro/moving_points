import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';

class MovingPoint extends StatefulWidget {
  MovingPoint({super.key, required this.data});

  DataPoint data;

  @override
  State<MovingPoint> createState() => _MovingPointState();
}

class _MovingPointState extends State<MovingPoint> {
  late double pointSize;

  @override
  void initState() {
    pointSize = 30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.data.x - (pointSize / 2),
      top: widget.data.y - (pointSize / 2),
      child: SizedBox(
        height: pointSize,
        width: pointSize,
        child: Container(
          decoration: BoxDecoration(
            color: widget.data.color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
