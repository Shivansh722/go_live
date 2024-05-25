import 'package:flutter/material.dart';
import 'package:srm_live/core/themes.dart';
import 'package:srm_live/src/presentation/screens/home.dart';
  // Ensure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: lightMode,  // Apply the lightMode theme
      home: const HomePage(),
    );
  }
}
