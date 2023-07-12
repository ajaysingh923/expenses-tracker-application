import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/view/Signupscreen.dart';
import 'package:get/get.dart';
import '../controller/account_controller.dart';

class Signinscreen extends StatefulWidget {
  static const router = '/Signinscreen';
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final controller = Get.put(Account());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width, 
        decoration:const BoxDecoration(
          gradient:LinearGradient(colors: [Colors.blue,Colors.blue,Color.fromARGB(255, 71, 143, 176)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,  Get.height * 0.1, 10, 20),
          
          child: SingleChildScrollView(
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.04),
                    Center(
                      child: Image(
                          height: Get.height * 0.1,
                          width: Get.width * 0.3,
                          image: const AssetImage('assets/images/logo.png')),    
                    ),
                    SizedBox(height: Get.height * 0.02),
                    const Text('Expenses Tracker',
                    style:  TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif')),

                    SizedBox(height: Get.height * 0.01),
                    const Text('Empower Your Finances, Track Your Expenses!',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                           )),

                    SizedBox(height: Get.height * 0.06),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email, color: Colors.white),
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
                    SizedBox(
                      width: Get.width,
                      height: Get.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login(
                              controller.email.text, controller.password.text);
                          controller.email.clear();
                          controller.password.clear();
                        },
                         style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                        child: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                      ),
                    ),

                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have a account?',
                          style: TextStyle(color: Colors.white,),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Signupscreen.router);
                            },
                            child: const Text('Sign Up', style: TextStyle(color: Colors.black,fontFamily: 'serif'),))
                      ],
                    ),

                     
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
