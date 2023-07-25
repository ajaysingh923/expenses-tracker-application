import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/view/signinscreen.dart';
import 'package:flutter_application_2/screens/homescreen.dart';
import 'package:get/get.dart';

class Account extends GetxController {
  var email = TextEditingController();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    firstname = TextEditingController();
    lastname = TextEditingController();
    confirmpassword = TextEditingController();
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      final valid = formKey.currentState!.validate();
      if (valid) {
        formKey.currentState!.save();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        Get.offAndToNamed(HomeScreen.router);
        Get.snackbar('Success', 'Login Successfully',
            snackPosition: SnackPosition.TOP);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Warning', 'user-not-found',
            snackPosition: SnackPosition.TOP);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Warning', 'Wrong password provided for that user.',
            snackPosition: SnackPosition.TOP);
      }
    }
  }

  void signup(String email, String password, String firstname, String lastname,
      String confirmpassword) async {
    try {
      final valid = formKey.currentState!.validate();
      if (valid) {
        formKey.currentState!.save();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        addUserDetails(firstname, lastname, email);
        
        FirebaseAuth.instance.currentUser!.updateDisplayName(firstname);
        Get.offAndToNamed(Signinscreen.router);
        Get.snackbar('Success', 'Signup Successfully',
            snackPosition: SnackPosition.TOP);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Warning', 'The password provided is too weak.',
            snackPosition: SnackPosition.TOP);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Warning', 'The account already exists for that email.',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      print(e);
    }
  }

  void addUserDetails(String firstname, String lastname, String email) async {
    await FirebaseFirestore.instance.collection('user').add({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
    });
  }
}
