class AppValdator {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجي ادخال الحقل السابق';
    }
    return null;
  }
  static String? countryValditor(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجي ادخال الحقل السابق';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجي ادخال الحقل السابق';
    } else if (value.length < 12) {
      return 'يرجي ادخال الرقم صحيح';
    }
    return null;
  }
  static String? passwordValditor(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجي ادخال الحقل السابق';
    } else if (value.length < 10 ) {
      return 'الرقم السري يجب ان يكون 10 ارقام ';
    }
    return null;
  }
}
