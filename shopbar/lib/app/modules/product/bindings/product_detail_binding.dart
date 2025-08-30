import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';
import '../../cart/services/cart_service.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartService>(() => CartService());
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
