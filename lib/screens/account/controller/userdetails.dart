import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);
  static const router = '/userdetails';
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Center(
        child: Text('User not logged in.'),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Email: ${user.email}', style: const TextStyle(fontSize: 20,
            color: Colors.blue,
          ),),
        Text('Display Name: ${user.displayName}',style: const TextStyle(fontSize: 20,
            color: Colors.blue,),)
      ],
    );
  }
}
