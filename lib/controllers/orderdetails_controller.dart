import 'package:customerapp/models/order_details_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderdetailsController extends GetxController {
  OrderDetailsModel? data;
  bool loading = false;
  getOrderdetails(String orderid) async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");
    var body = {'order_id': orderid, 'token': auth};
    final http.Response response = await http.post(
      Uri.parse('http://68.178.175.87/api/customerorder/detail'),
      body: body,
    );
    print('///////////sc${response.statusCode}');
    print(response.body);
    var value = orderDetailsModelFromJson(response.body);
    data = value;
    loading = false;
    update();
  }
}
