import 'package:flutter/material.dart';

class Mytansaction extends StatelessWidget {
  final String title;
  final String amount;
  final String expenseorincome;

  Mytansaction({
    required this.title,
    required this.amount,
    required this.expenseorincome,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[300],
            height: 50,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.attach_money_outlined,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(title, style: const TextStyle(fontSize: 15)),
                  ],
                ),
                Text(
                  (expenseorincome == 'expense' ? '-' : '+') + '\$' + amount,
                  style: TextStyle(
                      color: expenseorincome == 'expense'
                          ? Colors.red
                          : Colors.green),
                )
              ],
            ))));
  }
}
