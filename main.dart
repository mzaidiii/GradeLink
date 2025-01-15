import 'package:flutter/material.dart';
import 'package:grade_link/screens/front_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 190, 50, 221),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 11, 130, 243),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 96, 185, 213),
      ),
      home: FrontScreen(),
    );
  }
}
