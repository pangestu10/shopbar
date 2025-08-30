import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../../cart/services/cart_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartService>(() => CartService());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
