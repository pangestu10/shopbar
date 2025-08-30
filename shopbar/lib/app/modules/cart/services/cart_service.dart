import 'package:get/get.dart';

class CartService extends GetxService {
  var cartItems = <Map<String, dynamic>>[].obs;
  var totalItems = 0.obs;

  void addToCart(Map<String, dynamic> product) {
    // Check if product already exists in cart
    final existingItemIndex = cartItems.indexWhere((item) => item['id'] == product['id']);
    
    if (existingItemIndex != -1) {
      // Update quantity if product exists
      final existingItem = cartItems[existingItemIndex];
      final currentQuantity = existingItem['quantity'] ?? 1;
      cartItems[existingItemIndex] = {
        ...existingItem,
        'quantity': currentQuantity + 1,
      };
    } else {
      // Add new product to cart with quantity 1
      cartItems.add({
        ...product,
        'quantity': 1,
      });
    }
    
    _updateTotalItems();
    
    Get.snackbar(
      'Berhasil',
      '${product['title']} ditambahkan ke keranjang',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      _updateTotalItems();
    }
  }

  void updateQuantity(int index, int quantity) {
    if (index >= 0 && index < cartItems.length && quantity > 0) {
      cartItems[index] = {
        ...cartItems[index],
        'quantity': quantity,
      };
      _updateTotalItems();
    }
  }

  void _updateTotalItems() {
    int total = 0;
    for (var item in cartItems) {
      total += (item['quantity'] ?? 1) as int;
    }
    totalItems.value = total;
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      final price = double.tryParse(item['price']?.toString() ?? '0') ?? 0.0;
      final quantity = (item['quantity'] ?? 1) as int;
      total += price * quantity;
    }
    return total;
  }

  void clearCart() {
    cartItems.clear();
    totalItems.value = 0;
  }
}
