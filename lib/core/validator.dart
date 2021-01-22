class TitleFieldValidator {
  String errorText = "Title must to provide min 2 charachter";
  static String validate(String value) {
    if ((value.length < 2)) {
      return "Title must to provide min 2 charachter";
    } else {
      return null;
    }
  }
}
