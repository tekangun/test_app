import 'package:get/get.dart';
import 'package:test_app/core/init/get_it_init.dart';
import 'package:test_app/services/local_services/secure_storage.dart';
import 'package:test_app/views/login_screen/login_screen.dart';
import 'package:test_app/views/navigation_bar_screen/navigation_bar_screen.dart';

class SplashScreenViewModel {
  void checkUserAvailabe() async {
    var userToken = await getIt<SecureStorage>().getUserToken();
    await Future.delayed(const Duration(seconds: 1));
    if (userToken != null) {
      // user available, go to main screen
      Get.offAll(() => const NavigationBarScreen());
    } else {
      // user not avaiable, go to login screen
      Get.offAll(() => const LoginScreen());
    }
  }
}
