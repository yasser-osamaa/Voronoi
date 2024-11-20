import 'dart:math';
import 'package:flutter/material.dart';

class VoronoiPainter extends CustomPainter {
  final List<Point<double>> points;

  VoronoiPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint cellPaint = Paint()..style = PaintingStyle.fill;
    final Paint pointPaint = Paint()..color = Colors.black;

    // Calculate Voronoi cells using a brute-force approach
    const cellSize = 10.0;
    for (double x = 0; x < size.width; x += 2.5) {
      for (double y = 0; y < size.height; y += 2.5) {
        final Point<double> current = Point(x, y);

        // Find the closest point to the current grid cell
        Point<double>? closestPoint;
        double minDistance = double.infinity;
        for (final point in points) {
          final distance = _distance(current, point);
          if (distance < minDistance) {
            minDistance = distance;
            closestPoint = point;
          }
        }

        // Assign a color based on the closest point
        if (closestPoint != null) {
          cellPaint.color = _colorFromPoint(closestPoint);
          canvas.drawRect(
            Rect.fromLTWH(x, y, cellSize, cellSize),
            cellPaint,
          );
        }
      }
    }

    // Draw the points
    for (final point in points) {
      canvas.drawCircle(Offset(point.x, point.y), 6.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  // Utility to calculate the distance between two points
  double _distance(Point<double> p1, Point<double> p2) {
    return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2));
  }

  // Generate a color based on a point's position
  Color _colorFromPoint(Point<double> point) {
    final r = (point.x % 255).toInt();
    final g = (point.y % 255).toInt();
    final b = ((point.x + point.y) % 255).toInt();
    return Color.fromARGB(255, r, g, b);
  }
}
