// ignore_for_file: avoid_print

import 'package:customerapp/constants/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UpdateLocationController extends GetxController {
  bool loading = false;
  updateLocation(
      String emirates, String area, String building, String flat) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print(auth);
    var body = {
      'token': auth,
      'emirates': emirates,
      'area': area,
      'building': building,
      'flat_no': flat
    };
    final http.Response response = await http.post(
      Uri.parse('https://waterdelivery.calparglobal.com/api/customerdelivery/locationupdate'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Update Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          textColor: AppColors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          backgroundColor: AppColors.green1,
          msg: "Update Error",
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
