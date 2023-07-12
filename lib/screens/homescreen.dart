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
  void addnewincomeandexpenses() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: <Widget>[
                TextButton(
                  onPressed: addnewExpenses,
                  child: Text(
                    'Add Expenses',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                
                TextButton(
                  onPressed: addnewExpenses,
                  child: Text('Add income',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.redAccent,
                    
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                
              ],
            ));
  }

  void addnewIncome() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add new income'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
              ],
            ));
  }

  void addnewExpenses() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add new expenses'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
              ],
            ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addnewincomeandexpenses,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add_card),
          
          ),
        body: GetBuilder<Account>(
          builder: (controller) {
            controller.getdata();
            return Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, Get.height * 0.06, 10, 20),
                  child: Text('Hello, ${controller.myUsername}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ));
          },
        ));
  }
}
