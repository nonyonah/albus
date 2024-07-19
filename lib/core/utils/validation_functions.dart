bool isValidEmail(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*@([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(inputString);
  }
  return false;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(inputString);
  }
  return false;
}

bool isText(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z]+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(inputString);
  }
  return false;
}

bool isValidPhone(String? inputString, {bool isRequired = false}) {
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(inputString);
  }
  return false;
}
