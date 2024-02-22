// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/models/area_model.dart';
import 'package:customerapp/models/emirates_model.dart';
import 'package:customerapp/models/signup_model.dart';
import 'package:customerapp/screens/bottom_nav.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  @override
  void onInit() {
    // getEmirates();

    super.onInit();
  }

  List<GetEmirates> data = [];
  List<GetArea> value = [];

  // getEmirates() async {
  //   final http.Response response = await http.post(
  //     Uri.parse('http://68.178.175.87/api/getemirates'),
  //   );
  //   print('sc${response.statusCode}');
  //   data = getEmiratesFromJson(response.body);
  //   if (response.statusCode == 200) {
  //     getArea('');
  //   }
  // }

  // getArea(String? id) async {
  //   var body = {
  //     'emirates_id': id,
  //   };
  //   final http.Response response = await http
  //       .post(Uri.parse('http://68.178.175.87/api/getarea'), body: body);
  //   print('///Area/sc${response.statusCode}');
  //   print(response.body);
  //   value = getAreaFromJson(response.body);
  //   update();
  // }

  bool loading = false;
  signup(
      String name,
      String phone,
      String email,
      String password,
      String emirates,
      String area,
      String flat,
      String building,
      String count) async {
    print(
        '====>>>$name,$phone,$email,$password,${emirates},${area},$flat,$building');
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var body = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'emirates': emirates,
      'area': area,
      'flat_no': flat,
      'building': building,
      'no_of_bottles': count
    };
    final http.Response response = await http.post(
      Uri.parse('http://68.178.175.87/api/customer/signup'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);

    var data = signupModelFromJson(response.body);
    print(data.data?.apiToken);
    var token = data.data?.apiToken;
    var bottlecount = data.data?.noOfBottles;
    loading = false;
    update();

    if (response.statusCode == 200) {
      print("object");
      preferences.setString("token", token!);

      preferences.setString("bottle", bottlecount!);

      Get.offAll(() => BottomNav(
            position: 0,
          ));
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "signup Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 404) {
      Fluttertoast.showToast(
          backgroundColor: AppColors.red,
          msg: "signup Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    }

    update();
  }
}
