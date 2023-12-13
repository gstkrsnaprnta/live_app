import 'package:flutter/material.dart';
import 'package:live_app/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white, // Sesuaikan dengan warna yang diinginkan
        ),
        home: const DashboardView());
  }
}
