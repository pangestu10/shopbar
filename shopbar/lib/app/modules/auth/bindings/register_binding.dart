import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../../../services/auth_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
