import 'package:blablacar/week8/ui/screens/home/home_screen.dart';
import 'package:blablacar/week8/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// Launch the application with the given list of providers
///
void mainCommon(List<InheritedProvider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: BlaBlaApp()),
    ),
  );
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
