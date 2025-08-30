import 'package:get/get.dart';
import '../services/product_service.dart';

class ProductDetailController extends GetxController {
  final ProductService _productService = ProductService();
  
  final RxBool isLoading = true.obs;
  final RxMap<String, dynamic> product = <String, dynamic>{}.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductDetail();
  }

  Future<void> fetchProductDetail() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final Map<String, dynamic> args = Get.arguments ?? {};
      final int? productId = args['id'] as int?;
      
      if (productId != null) {
        final productData = await _productService.fetchProductById(productId);
        product.value = productData;
      } else {
        // If no ID is provided, use the passed product data directly
        product.value = args;
      }
    } catch (e) {
      errorMessage.value = 'Failed to load product details: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void retryFetch() {
    fetchProductDetail();
  }
}
