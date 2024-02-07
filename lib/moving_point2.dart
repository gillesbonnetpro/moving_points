import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';

class MovingPoint extends StatefulWidget {
  MovingPoint({super.key, required this.data, this.previousData});

  DataPoint? previousData;
  DataPoint data;

  @override
  State<MovingPoint> createState() => _MovingPointState();
}

class _MovingPointState extends State<MovingPoint> {
  late double pointSize;
  bool fire = false;
  late double prevX;
  late double newX;
  late double prevY;
  late double newY;

  @override
  void initState() {
    pointSize = 30;
    prevX = widget.previousData == null
        ? widget.data.x - (pointSize / 2)
        : widget.previousData!.x - (pointSize / 2);
    prevY = widget.previousData == null
        ? widget.data.y - (pointSize / 2)
        : widget.previousData!.y - (pointSize / 2);
    newX = widget.data.x - (pointSize / 2);
    newY = widget.data.y - (pointSize / 2);

    Timer(
      const Duration(milliseconds: 250),
      () => setState(() {
        fire = true;
      }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: fire ? newX : prevX,
      top: fire ? newY : prevY,
      duration: const Duration(seconds: 1),
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
