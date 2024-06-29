// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_theme.dart';
import 'package:customerapp/models/profile_model.dart';
import 'package:customerapp/screens/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    fetchData();

    super.onInit();
  }

  ProfileModel? data;
  bool loading = false;

  fetchData() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print("===???$auth");
    final http.Response response = await http.get(
      Uri.parse('https://waterdelivery.calparglobal.com/api/customer/profile/$auth'),
    );
    print(response.statusCode);
    print(response.body);
    var value = profileModelFromJson(response.body);
    data = value;
    loading = false;
    update();
  }

  logout() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print("===???$auth");
    final http.Response response = await http.get(
      Uri.parse('https://waterdelivery.calparglobal.com/api/driver/logout/$auth'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      preferences.setString("token", '');
      Get.offAll(LoginScreen());
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Logout Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    }
    loading = false;
    update();
  }
}
