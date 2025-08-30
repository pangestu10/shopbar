import 'package:get/get.dart';

import '../services/cart_service.dart';

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();

  // Get cart items
  List<Map<String, dynamic>> get cartItems => cartService.cartItems;

  // Get total items count
  int get totalItems => cartService.totalItems.value;

  // Get total price
  double get totalPrice => cartService.getTotalPrice();

  // Add to cart
  void addToCart(Map<String, dynamic> product) {
    cartService.addToCart(product);
  }

  // Remove from cart
  void removeFromCart(int index) {
    cartService.removeFromCart(index);
  }

  // Update quantity
  void updateQuantity(int index, int quantity) {
    cartService.updateQuantity(index, quantity);
  }

  // Clear cart
  void clearCart() {
    cartService.clearCart();
  }
}
