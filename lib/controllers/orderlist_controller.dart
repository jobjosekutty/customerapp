import 'package:customerapp/models/orderlist_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrderlistController extends GetxController {
  List<OrderListModel> data = [];
  bool loading = false;
  getData() async {
    loading = true;
    update();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = preferences.getString("token");

    final http.Response response = await http.get(
      Uri.parse('https://waterdelivery.calparglobal.com/api/customerorder/lists/$auth'),
      //  body: body,
    );
    print('////orderlist/sc${response.statusCode}');
    print(response.body);
    var value = orderListModelFromJson(response.body);
    data = value;
    loading = false;
    update();
  }
}
