import 'package:flutter/material.dart';
import 'package:mosam_azbow/Screens/Profile/main_profile_screen.dart';

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
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      // home: const DetailsPage(
      //   index: 4,
      // ),

      home: MainProfileScreen(
          //index: 4,
          ),
    );
  }
}
