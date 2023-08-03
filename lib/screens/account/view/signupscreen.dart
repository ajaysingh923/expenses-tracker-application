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
        leading: IconButton(
            onPressed: () => Get.toNamed(Signinscreen.router),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            color: Colors.black),
        title: const Text(
          'Sign up',
          style: TextStyle(color: Colors.black,fontSize: 25,),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 71, 143, 176)],
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
                            const Icon(Icons.person, color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
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
                            const Icon(Icons.person, color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
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
                            const Icon(Icons.email, color: Colors.black54),
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
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
                        prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
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
                        prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password again',
                        labelStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
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
                            backgroundColor: Colors.amberAccent,
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
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Signinscreen.router);
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(color: Colors.white, fontFamily: 'serif'),
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
