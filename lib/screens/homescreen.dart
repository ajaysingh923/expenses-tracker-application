import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/controller/homescreen_details.dart';
import 'package:flutter_application_2/screens/account/controller/transaction_detail.dart';

class HomeScreen extends StatefulWidget {
  static const router = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isIncome = false;
  final _formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final name = TextEditingController();

  void newTransaction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text(
                  'Add new transaction',
                  style: TextStyle(letterSpacing: 2),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Expenses',
                            style: TextStyle(color: Colors.red),
                          ),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          const Text(
                            'Income',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Title',
                              ),
                              controller: name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Amount',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: amount,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.redAccent,
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      name.clear();
                      amount.clear();
                    },
                  ),
                  MaterialButton(
                    color: Colors.green,
                    child: const Text('Enter',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        name.clear();
                        amount.clear();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const Homescreentop(),
            
            const Homescreenbottom(
              balance: ' 10,000',
              expenses: ' 5,000',
              income: ' 15,000',
            ),
            Expanded(
                child: Container(
              child:  Center(
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    const Text('Recent Transactions',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                     Mytansaction(title: '',amount: '',expenseorincome: '',),
                    
                 
                  
                   
                  ],
                )
              ),
            )),
            Bottombutton(
              function: newTransaction,
            ),
          ]),
        ));
  }
}
