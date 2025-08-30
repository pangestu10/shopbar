import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  
  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  void updateFullName(String value) => fullName.value = value;
  void updateEmail(String value) => email.value = value;
  void updatePassword(String value) => password.value = value;
  void updateConfirmPassword(String value) => confirmPassword.value = value;

  Future<void> register() async {
    try {
      isLoading(true);
      errorMessage('');
      
      if (fullName.value.isEmpty || email.value.isEmpty || password.value.isEmpty || confirmPassword.value.isEmpty) {
        throw 'Semua field harus diisi';
      }

      if (password.value != confirmPassword.value) {
        throw 'Password dan konfirmasi password tidak cocok';
      }

      if (password.value.length < 6) {
        throw 'Password harus minimal 6 karakter';
      }

      await _authService.signUpWithEmailAndPassword(email.value, password.value, fullName.value);
      
      // Navigate to home after successful registration
      Get.offAllNamed('/home');
      
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Registrasi Gagal',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void navigateToLogin() {
    Get.back();
  }
}
