import 'package:flutter/material.dart';
import 'package:moving_points/data_point.dart';

class MovingPoint extends StatefulWidget {
  MovingPoint({super.key, required this.data});

  DataPoint data;

  @override
  State<MovingPoint> createState() => _MovingPointState();
}

class _MovingPointState extends State<MovingPoint> {
  @override
  Widget build(BuildContext context) {
    print('size du moving point : ${MediaQuery.of(context).size.shortestSide}');

    return Positioned(
      left: widget.data.x,
      top: widget.data.y,
      child: SizedBox(
        height: MediaQuery.of(context).size.shortestSide / 50,
        width: MediaQuery.of(context).size.shortestSide / 50,
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
