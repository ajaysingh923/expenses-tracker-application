import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const router = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, Colors.blue, Color.fromARGB(255, 71, 143, 176)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
          padding: EdgeInsets.fromLTRB(20,  Get.height * 0.08, 10, 20),
      child: const Text('Hello,' ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
    )));
  }
}
