// ignore_for_file: library_private_types_in_public_api
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:voronoi/voronoi_painter.dart';

class VoronoiHomePage extends StatefulWidget {
  const VoronoiHomePage({super.key});

  @override
  _VoronoiHomePageState createState() => _VoronoiHomePageState();
}

class _VoronoiHomePageState extends State<VoronoiHomePage> {
  final List<Point<double>> _points = [];

  void _addPoint(Point<double> point) {
    setState(() {
      _points.add(point);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voronoi Diagram "),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _points.clear();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTapDown: (details) {
          final point =
              Point(details.localPosition.dx, details.localPosition.dy);
          _addPoint(point);
        },
        child: CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: VoronoiPainter(_points),
        ),
      ),
    );
  }
}
