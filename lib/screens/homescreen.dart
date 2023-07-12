import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/controller/account_controller.dart';
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
    return Scaffold(body: GetBuilder<Account>(
      builder: (controller) {
        controller.getdata();
        return Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blue,
                Color.fromARGB(255, 71, 143, 176)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, Get.height * 0.08, 10, 20),
              child: Text('Hello, ${controller.myUsername}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ));
      },
    ));
  }
}
