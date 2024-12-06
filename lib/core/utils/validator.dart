import 'package:email_validator/email_validator.dart';
import 'package:regexed_validator/regexed_validator.dart';

mixin Validator {
  // email
  String? validateEmail(String? value) {
    if (value != null && value.isEmpty) {
      return 'Email is required';
    } else if (!EmailValidator.validate(value!) && value.isNotEmpty) {
      return 'Please enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return 'Password is required';
    } else if (value!.length < 8) {
      return 'Password must be at least 8 charcaters';
    } else {
      return null;
    }
  }

  // Confirm password validation
  String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      return 'Confirm password does not match';
    }
    return null;
  }

  String? validateOTP(String? value) {
    if (value != null && value.isEmpty) {
      return 'OTP is required';
    } else if (value!.length < 4) {
      return 'OTP must be at least 4 digits';
    } else {
      return null;
    }
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      //isValidatePhoneErrorShow(true);
      return 'Mobile number is required';
    } else if (!isNumeric(value)) {
      //isValidatePhoneErrorShow(true);
      return 'Mobile number must contain only numeric values';
    } else {
      // isValidatePhoneErrorShow(false);
      return null;
    }
  }

  bool? isValidatePhoneErrorShow(bool? value) {
    if (value == null || value == false) {
      return false;
    } else {
      return true;
    }
  }

  String? validateVerifyOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (!isNumeric(value)) {
      return 'OTP must numeric';
    } else if (value.length < 4) {
      return 'OTP must be at least 4 digits';
    } else {
      return null;
    }
  }

  String? validateFullname(String? value) {
    if (value != null && value.isEmpty) {
      return 'Full Name is required';
    } else if (value!.length < 3) {
      return 'Full Name must be at least 3 charcaters';
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return 'Name is required';
    } else if (value!.length < 3) {
      return 'Name must be at least 3 charcaters';
    } else {
      return null;
    }
  }

  String? validateCompanyName(String? value) {
    if (value != null && value.isEmpty) {
      return 'Company name is required';
    } else if (value!.length < 3) {
      return 'Company name must be at least 3 charcaters';
    } else {
      return null;
    }
  }

  String? validateUrlWebSite(String? value) {
    if (value != null && value.isEmpty) {
      return 'Webiste URL is required';
    } else if (!validator.url(value!)) {
      return 'Please enter a valid website URL';
    } else {
      return null;
    }
  }

  String? validateFirstname(String? value) {
    if (value != null && value.isEmpty) {
      return 'First Name is required';
    } else if (value!.length < 3) {
      return 'First Name must be at least 3 charcaters';
    } else {
      return null;
    }
  }

  String? validateLastname(String? value) {
    if (value != null && value.isEmpty) {
      return 'Last Name is required';
    } else {
      return null;
    }
  }

  String? validateall(String? value, String title) {
    if (value != null && value.isEmpty) {
      return '$title is required';
    } else {
      return null;
    }
  }
}
