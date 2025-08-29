import 'package:get/get.dart';
import '../services/profile_service.dart';

class ProfileController extends GetxController {
  var user = {}.obs;
  var isLoading = true.obs;

  final ProfileService _profileService = ProfileService();

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var userData = await _profileService.fetchUser();
      if (userData != null) {
        user.value = userData;
      }
    } finally {
      isLoading(false);
    }
  }
}
