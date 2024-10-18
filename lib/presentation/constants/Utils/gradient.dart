import 'package:flutter/material.dart';

class GradientView extends StatelessWidget {
  const GradientView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient View',
      theme: ThemeData(
          colorScheme: ColorScheme.dark(
        primary: const Color(0xff6026C0).withOpacity(0.8),
        secondary: const Color(0xff8C2FC8).withOpacity(0.8),
      )),
    );
  }
}
