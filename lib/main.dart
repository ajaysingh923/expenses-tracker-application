import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/route/approutes/app_routes.dart';
import 'package:flutter_application_2/screens/account/controller/googleshets.dart';
import 'package:flutter_application_2/screens/account/view/signinscreen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GoogleSheetsApi().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Signinscreen(),
      getPages: appRoutes(),
    );
  }
}
