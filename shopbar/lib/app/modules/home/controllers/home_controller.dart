import 'package:get/get.dart';
import '../services/home_service.dart';
import '../../profile/services/profile_service.dart';

class HomeController extends GetxController {
  var homeProductsList = <dynamic>[].obs;
  var user = {}.obs;
  var isLoading = true.obs;

  final HomeService _homeService = HomeService();
  final ProfileService _profileService = ProfileService();

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
      var userData = await _profileService.fetchUser();
      user.value = userData;
    } catch (e) {
      // Handle error
    }
  }
}
