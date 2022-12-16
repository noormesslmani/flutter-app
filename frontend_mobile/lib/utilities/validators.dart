class Validator {
  static String? validateEmail(String value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    const emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    final result = RegExp(emailPattern, caseSensitive: false).hasMatch(value);
    if (!result) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateInput(String value) {
    if (value!.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }
}
