import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/view/signinscreen.dart';
import 'package:get/get.dart';
import '../controller/account_controller.dart';

class Signupscreen extends StatefulWidget {
  static const router = '/Signupscreen';
   const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();}

class _SignupscreenState extends State<Signupscreen> {
  final controller = Get.put(Account());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
         const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'serif'),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue, Color.fromARGB(255, 71, 143, 176)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, Get.height * 0.1, 10, 20),
          child: SingleChildScrollView(
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.04),
                    TextFormField(
                      controller: controller.firstname,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        labelText: 'First Name',
                        hintText: 'Enter your First Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your First name';
                        }
                        return null;
                      },
                    ),

                     SizedBox(height: Get.height * 0.04),
                    TextFormField(
                      controller: controller.lastname,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        labelText: 'Last Name',
                        hintText: 'Enter your Last Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Last name';
                        }
                        return null;
                      },
                    ),


                    SizedBox(height: Get.height * 0.04),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.04),
                    TextFormField(
                      controller: controller.password,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.04),
                    TextFormField(
                      controller: controller.confirmpassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password again',
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if(value != controller.password.text){
                          return 'Password does not match';
                        }
                        else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.04),
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.06,
                      child: ElevatedButton(
                        onPressed: (
                          
                        ) {
                          Get.toNamed(Signinscreen.router);

                          controller.signup(
                              controller.email.text,
                              controller.password.text,
                              controller.firstname.text,
                              controller.lastname.text,
                              controller.confirmpassword.text);
                          controller.email.clear();
                          controller.password.clear();
                          controller.firstname.clear();
                          controller.lastname.clear();
                          controller.confirmpassword.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),

                     SizedBox(height: Get.height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have a account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Signinscreen.router);
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(color: Colors.black, fontFamily: 'serif'),
                            ))
                      ],
                    )
                  ],
                )
                
                ),
          ),
        ),
      ),
    );
  }
}
