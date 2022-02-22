import 'package:get/get.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final token = ''.obs;

  get hasToken => token.value != '';

  void setToken(newValue) {
    token.value = newValue;
  }
}
