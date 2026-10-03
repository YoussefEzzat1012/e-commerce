abstract class Validators {
  Validators._();

  /// Validates required text fields.
  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  /// Validates email address format.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required.';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&'
      r'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  /// Validates password strength (min length, letter & number requirement).
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long.';
    }

    return null;
  }

  /// Validates that password confirmation matches the primary password.
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password.';
    }

    if (value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }

  /// Validates phone numbers (accepts digits, spaces, hyphens, and optional + prefix).
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');

    final cleanPhone = value.replaceAll(RegExp(r'[\s-]'), '');

    if (!phoneRegex.hasMatch(cleanPhone)) {
      return 'Please enter a valid phone number.';
    }

    return null;
  }

  /// Validates numeric input (e.g., product quantity or price range).
  static String? validateNumber(String? value, {String fieldName = 'Value'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }

    final numValue = num.tryParse(value.trim());
    if (numValue == null) {
      return 'Please enter a valid number.';
    }

    return null;
  }
}
