import 'package:customerapp/models/coupon_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CouponController extends GetxController {
  @override
  void onInit() {
    getCoupon();

    super.onInit();
  }

  bool loading = false;
  List<CouponModel>? data;
  getCoupon() async {
    loading = true;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    print(auth);
    var body = {'token': auth};
    final http.Response response = await http.post(
      Uri.parse('https://waterdelivery.calparglobal.com/api/customer/couponlists'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    var value = couponModelFromJson(response.body);
    data = value;
    loading = false;

    update();
  }
}
