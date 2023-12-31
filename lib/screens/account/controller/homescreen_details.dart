import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_controller.dart';

class Homescreentop extends StatelessWidget {
  Homescreentop({super.key});
  final Account controller = Get.put(Account());
  @override
  Widget build(BuildContext context) {
    controller.getCurrentUserDetail();
    return Container(
      height: 105,
      padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              Text('Hello, ${controller.userFullname.toUpperCase()}!',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/ajay.png'),
                ),
                onPressed: () {
                  Get.offAndToNamed('/ProfileScreen');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Homescreenbottom extends StatelessWidget {
  final String balance;
  final String expenses;
  final String income;
  const Homescreenbottom(
      {super.key,
      required this.balance,
      required this.expenses,
      required this.income});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 71, 143, 176),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade700,
                  blurRadius: 10,
                  offset: const Offset(4.0, 4.0), // changes position of shadow
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  offset: Offset(-4.0, -4.0), // changes position of shadow
                )
              ]),
          height: 200,
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('TOTAL BALANCE',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('\₹' + balance,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 40)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 45, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Expense',
                                  style: TextStyle(color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('\₹' + expenses,
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Income',
                                  style: TextStyle(color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('\₹' + income,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 133, 208, 136),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Bottombutton extends StatelessWidget {
  final function;

  const Bottombutton({this.function});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.green,
      child: IconButton(
        icon: const Icon(
          Icons.add_card,
          color: Colors.black,
        ),
        onPressed: function,
      ),
    );
  }
}
