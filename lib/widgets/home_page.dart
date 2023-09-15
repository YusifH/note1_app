import 'package:flutter/material.dart';
import 'package:note_app/constant/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.cPrimary,
        title: const Text(AppConstants.title),
      ),
      body: const Center(
        child: Text('text'),
      ),
    );
  }
}
