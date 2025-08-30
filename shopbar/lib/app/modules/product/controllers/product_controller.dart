import 'package:get/get.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  var productList = <dynamic>[].obs;
  var isLoading = true.obs;

  final ProductService _productService = ProductService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await _productService.fetchProducts();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
