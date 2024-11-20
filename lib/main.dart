import 'package:flutter/material.dart';
import 'package:voronoi/voronoi_home_page.dart';

void main() {
  runApp(const MyVoronoiApp());
}

class MyVoronoiApp extends StatelessWidget {
  const MyVoronoiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VoronoiHomePage(),
    );
  }
}
