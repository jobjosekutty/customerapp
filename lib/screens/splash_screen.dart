// ignore_for_file: must_be_immutable

import 'package:customerapp/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/logo.jpeg',
        height: 200,
        width: 200,
      )),
    );
  }
}
