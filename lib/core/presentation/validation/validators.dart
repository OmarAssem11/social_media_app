String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'emailCanNotBeEmpty';
  } else if (!RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email)) {
    return 'invalidEmailFormat';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.length < 8) {
    return 'passwordCanNotBeLessThanEightCharacters';
  }
  return null;
}

String? generalValidator({
  required String fieldName,
  required String? value,
}) {
  if (value == null || value.isEmpty) {
    return '$fieldName canNotBeEmpty';
  }
  return null;
}
