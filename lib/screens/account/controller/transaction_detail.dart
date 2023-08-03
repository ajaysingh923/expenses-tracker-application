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
        borderRadius: BorderRadius.circular(30),
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0,5,0,5),
            
            
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
                        child:  Center(
                          child: Icon(
                            Icons.attach_money_outlined,
                            color: expenseorincome == 'expense'
                          ? Colors.red
                          : Colors.green
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(title, style: const TextStyle(fontSize: 15)),
                        
                  ],
                ),
                Text(
                  (expenseorincome == 'expense' ? '-' : '+') + '\₹' + amount,
                  style: TextStyle(
                      color: expenseorincome == 'expense'
                          ? Colors.red
                          : Colors.green),
                ),
                
              ],
              
            ))));
  }
}



