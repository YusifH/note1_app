import 'package:flutter/material.dart';
import 'package:note_app/constant/app_constants.dart';
import 'package:note_app/widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Note',
      theme: ThemeData(
        primarySwatch: AppConstants.cPrimary,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

