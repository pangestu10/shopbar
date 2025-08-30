import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  
  final email = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  void updateEmail(String value) => email.value = value;
  void updatePassword(String value) => password.value = value;

  Future<void> login() async {
    try {
      isLoading(true);
      errorMessage('');
      
      if (email.value.isEmpty || password.value.isEmpty) {
        throw 'Email dan password harus diisi';
      }

      await _authService.signInWithEmailAndPassword(email.value, password.value);
      
      // Navigate to home after successful login
      Get.offAllNamed('/home');
      
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Login Gagal',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }
}
