import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../services/cart_service.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartService>(() => CartService());
    Get.lazyPut<CartController>(() => CartController());
  }
}
