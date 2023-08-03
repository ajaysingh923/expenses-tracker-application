import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/view/profile_screen.dart';
import 'package:get/get.dart';
import 'package:simple_icons/simple_icons.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});
  static const router = '/Contactus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.toNamed(ProfileScreen.router),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            color: Colors.black),
        title: const Text(
          'Contact Us.',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(40, 50, 0, 0),
          child: const Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text('Email: '),
                    Text(
                      'expensestracker@gmail.com',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.call_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text('Mobile Number: '),
                    Text(
                      '+977-9823192305',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.phone_android_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text('Phone Number: '),
                    Text(
                      '01-1524885',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        SimpleIcons.github,
                        color: Colors.black,
                      ),
                    ),
                    Text('Github: '),
                    Text(
                      'expensestracker2023',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,),

                 Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        SimpleIcons.facebook,
                        color: Colors.black,
                      ),
                    ),
                    Text('Facebook: '),
                    Text(
                      'Expenses Tracker',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
