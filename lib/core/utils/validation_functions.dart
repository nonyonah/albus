bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*@([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  
  return isInputStringValid;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  } else if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  
  return isInputStringValid;
}
