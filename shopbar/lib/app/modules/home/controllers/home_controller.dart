import 'package:get/get.dart';
import '../services/home_service.dart';
import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  var homeProductsList = <dynamic>[].obs;
  var user = {}.obs;
  var isLoading = true.obs;

  final HomeService _homeService = HomeService();
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    fetchHomeProducts();
    fetchUser();
    super.onInit();
  }

  void fetchHomeProducts() async {
    try {
      var products = await _homeService.fetchHomeProducts();
      homeProductsList.value = products;
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  void fetchUser() async {
    try {
      final currentUser = _authService.currentUser;
      if (currentUser != null) {
        user.value = {
          'email': currentUser.email,
          'displayName': currentUser.displayName,
          'photoURL': currentUser.photoURL,
        };
      }
    } catch (e) {
      // Handle error
    }
  }
}
