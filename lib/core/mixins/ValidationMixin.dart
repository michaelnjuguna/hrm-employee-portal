mixin ValidationMixin {
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
  }

  bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^\');
    return phoneRegex.hasMatch(phone);
  }
}
