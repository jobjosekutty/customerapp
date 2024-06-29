// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/models/login_model.dart';
import 'package:customerapp/screens/bottom_nav.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool loading = false;
  login(String phone, String password) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var body = {'username': phone, 'password': password};
    final http.Response response = await http.post(
      Uri.parse('https://waterdelivery.calparglobal.com/api/custlogin'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    var jsonResponse = jsonDecode(response.body);

    var data = loginModelFromJson(response.body);
    print(data.data?.apiToken);
    var token = data.data?.apiToken;
    loading = false;

    if (response.statusCode == 200) {
      print("object");
      preferences.setString("token", token!);
      Get.offAll(BottomNav(
        position: 0,
      ));
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          backgroundColor: AppColors.red,
          msg: "${response.statusCode},$jsonResponse['error']",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    }

    update();
  }
}
