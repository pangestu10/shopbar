import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class ProfileController extends GetxController {
  var user = {}.obs;
  var isLoading = true.obs;

  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      final currentUser = _authService.currentUser;
      if (currentUser != null) {
        user.value = {
          'email': currentUser.email,
          'displayName': currentUser.displayName,
          'photoURL': currentUser.photoURL,
        };
      }
    } finally {
      isLoading(false);
    }
  }
}
