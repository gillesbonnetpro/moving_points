import 'package:flutter/material.dart';
import 'package:moving_points/moving_point.dart';
import 'package:moving_points/my_custom_painter.dart';
import 'dart:math' as math;

import 'data_point.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moving Points',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Moving Points'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<DataPoint> dataPointList;

  @override
  void initState() {
    dataPointList = [];
    super.initState();
  }

  // retourne la liste de points à afficher
  List<Widget> getWidgetList() {
    List<Widget> list = [];

    list.add(
      CustomPaint(
        painter: MyCustomPainter(pointsList: dataPointList),
      ),
    );

    for (var dataPoint in dataPointList) {
      list.add(
        MovingPoint(
          data: dataPoint,
          onMove: (x, y) {
            setState(() {
              dataPoint.x = x;
              dataPoint.y = y;
            });
          },
          onRelease: () {
            final Color newColor =
                Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0);
            final double newX = math.Random().nextDouble() *
                    (MediaQuery.of(context).size.width * 0.8) +
                15;
            final double newY = math.Random().nextDouble() *
                    (MediaQuery.of(context).size.height * 0.8) +
                15;

            setState(() {
              dataPointList.add(
                DataPoint(x: newX, y: newY, color: newColor),
              );
            });
          },
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (dataPointList.isEmpty) {
      final Color newColor =
          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0);
      final double newX = math.Random().nextDouble() *
              (MediaQuery.of(context).size.width * 0.8) +
          15;
      final double newY = math.Random().nextDouble() *
              (MediaQuery.of(context).size.height * 0.8) +
          15;
      dataPointList.add(DataPoint(x: newX, y: newY, color: newColor));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => setState(() {
              dataPointList.clear();
            }),
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Container(
          color: Colors.blueGrey,
          child: Stack(
            fit: StackFit.expand,
            children: getWidgetList(),
          ),
        ),
      ),
    );
  }
}
