import 'package:blablacar/week8/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const BlaBlaApp());
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
