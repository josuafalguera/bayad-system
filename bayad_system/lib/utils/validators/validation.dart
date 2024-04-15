class Validator {
  static String? validateEmptyText(String? fieldname, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldname is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    // Check for minimum password length
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    // Check for uppercase letters
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for numbers
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special characters
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    // Updated RegExp to match Philippine phone numbers
    // This will match numbers with or without the +63 country code
    final phoneRegExp = RegExp(r'^(?:\+63)?[0-9]{11}$');
    if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
