import 'package:flutter_application_2/screens/account/controller/profile_edit.dart';
import 'package:flutter_application_2/screens/account/view/profile_screen.dart';
import 'package:flutter_application_2/screens/account/view/signupscreen.dart';
import 'package:flutter_application_2/screens/homescreen.dart';
import 'package:flutter_application_2/screens/account/view/signinscreen.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(name: HomeScreen.router, page: () => const HomeScreen()),
      GetPage(name: Signinscreen.router, page: () => const Signinscreen()),
      GetPage(name: Signupscreen.router, page: () => const Signupscreen()),
      GetPage(name:ProfileScreen.router, page: () => const ProfileScreen()),
      GetPage(name: EditProfile.router, page: () => const EditProfile()),




    ];
