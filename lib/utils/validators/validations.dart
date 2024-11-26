class CFSValidator {

  // Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value){
    if(value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }


  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is Required.";
    }

    //Regular Expression for Email Validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required.";
    }

    //Check for minimum password length
    if (value.length < 6) {
      return 'Password must be 6 character long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    //Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    //Check for special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is Required.";
    }

    //Regular expression for phone number validation (assuming a 10 digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digit required).';
    }

    return null;
  }

//Add more custom validators as needed for your specific requirements
}
