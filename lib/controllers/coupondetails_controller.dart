

import 'package:customerapp/models/coupon_details_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CouponDetailController extends GetxController {
  List<CouponDetailsModel> data = [];
  bool loading = false;
  getCoupon(String id) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print(auth);
    var body = {'book_id': id, 'token': auth};
    final http.Response response = await http.post(
      Uri.parse('http://68.178.175.87/api/customer/couponsheet'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    var value = couponDetailsModelFromJson(response.body);
    data = value;
    loading = false;
    update();
  }
}
