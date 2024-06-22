import 'package:flutter/material.dart';
import 'package:mosam_azbow/presentation/screens/Profile/main_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MainProfileScreen(
          //index: 4,
          ),
    );
  }
}
