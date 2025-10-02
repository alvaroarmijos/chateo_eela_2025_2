class Validators {
  static String? validateEmail(String? email) {
    const String emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    }
    final regex = RegExp(emailRegex);
    if (!regex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null; // Retur
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty';
    }

    if (name.length < 2) {
      return 'No valid name';
    }
    return null;
  }
}
