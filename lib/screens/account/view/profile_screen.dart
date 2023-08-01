import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/controller/profile_menu.dart';
import 'package:flutter_application_2/screens/account/controller/profile_edit.dart';
import 'package:flutter_application_2/screens/homescreen.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  static const router = '/ProfileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
              Stack(
                children: [
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage('assets/images/ajay.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: const Icon(
                        Icons.camera_enhance_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Marshell D. Teach',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('a@gmail.com',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () 
                    => Get.to(() => const EditProfile()),
                  
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('EditProfile',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),

            ProfileMenuWidget(
                  title: "User Information",
                  icon: Icons.person,
                  onPress: () {}),
              const SizedBox(height: 20),

              ProfileMenuWidget(
                  title: "Theme", icon: Icons.sunny, onPress: () {}),
              const SizedBox(height: 20),
              
              ProfileMenuWidget(
                  title: "About us", icon: Icons.info, onPress: () {}),
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
