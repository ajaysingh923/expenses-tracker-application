import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/controller/contact_us.dart';
import 'package:flutter_application_2/screens/account/controller/darkmode/darkmode_select.dart';
import 'package:flutter_application_2/screens/account/controller/profile_menu.dart';
import 'package:flutter_application_2/screens/account/controller/profile_edit.dart';
import 'package:flutter_application_2/screens/homescreen.dart';
import 'package:get/get.dart';

import '../controller/account_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const router = '/ProfileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   final Account controller = Get.put(Account());
  @override
  Widget build(BuildContext context) {
    controller.getCurrentUserDetail();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.toNamed(HomeScreen.router),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            color: Colors.black),
        title: const Text(
          'My Profile.',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
            const  Stack(
                children: [
                   SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage('assets/images/ajay.png'),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     height: 40,
                  //     width: 40,
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //     child: IconButton(
                  //       icon: const Icon(Icons.camera_enhance_outlined),
                  //       color: Colors.white,
                  //       onPressed: () {},
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
               Text(controller.userFullname,
                  style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
               Text(controller.userEmail,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const EditProfile()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('EditProfile',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 15),
              // ProfileMenuWidget(
              //     title: "Theme",
              //     icon: Icons.sunny,
              //     onPress: () {
              //       Get.toNamed(DarkButton.router);
              //     }),
              // const SizedBox(height: 20),
              ProfileMenuWidget(
                  title: "Contact Us",
                  icon: Icons.call_made_outlined,
                  onPress: () {
                    Get.toNamed(Contactus.router);
                  }),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.exit_to_app,
                  textColor: Colors.redAccent,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed('/Signinscreen');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
