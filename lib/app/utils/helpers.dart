String? validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Required to fill";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}

String? validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Mobile phone number is required";
  } else if (!regExp.hasMatch(value)) {
    return "Mobile phone number must contain only digits";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.length <= 6)
    return 'Password needs at least 6 characters';
  else
    return null;
}

String? validateEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());

  if (!regex.hasMatch(value ?? ''))
    return 'E-mail Invalid';
  else
    return null;
}
