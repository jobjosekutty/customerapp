import 'package:customerapp/screens/bottom_nav.dart';
import 'package:customerapp/screens/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//e634a887c390406494cf62e006f949c91367117f087517a833856c1fa89067e7ce604f91fedc4bd260191702664102

class SplashController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(const Duration(milliseconds: 3000), () {
      var auth = preferences.getString("token");
      print("===>$auth");
      if (auth != null && auth.toLowerCase().isNotEmpty) {
        Get.off(BottomNav(
          position: 0,
        ));
      } else {
        Get.off(LoginScreen());
      }
    });
  }
}
