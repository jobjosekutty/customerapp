// ignore_for_file: avoid_print, file_names

import 'package:customerapp/constants/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  int? Number;

  bool loading = false;

  getCount(String count) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    var body = {'token': auth, 'no_of_bottles': count};
    final http.Response response = await http.post(
      Uri.parse('https://waterdelivery.calparglobal.com/api/customer/createorder'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    print(response.body);
    loading = false;
    update();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    }
  }
}
