import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/account/view/profile_screen.dart';
import 'package:get/get.dart';

class DarkButton extends StatelessWidget {
  static const router = '/DarkButton';
  const DarkButton({super.key});

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
          'Theme.',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: RadioExample(),
      ),
    );
  }
}

enum SingingCharacter { light,dark  , system }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? mode = SingingCharacter.system;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Dark'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.dark,
            groupValue: mode,
            onChanged: (SingingCharacter? value) {
              setState(() {
                mode = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Light'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.light,
            groupValue: mode,
            onChanged: (SingingCharacter? value) {
              setState(() {
                mode = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('System'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.system,
            groupValue: mode,
            onChanged: (SingingCharacter? value) {
              setState(() {
                mode = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
