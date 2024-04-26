import 'package:assalam/Utlis/colors.dart';
import 'package:flutter/material.dart';
import 'Bottom Bar/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assalam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainTheme),
        useMaterial3: true,
      ),
      home: const BottomBar(),
    );
  }
}
