import 'package:flutter_test/flutter_test.dart';

import '../lib/core/validator.dart';

void main() {
  TitleFieldValidator validator;
  var divider =
      "========================================================================================================";

  setUp(() {
    validator = TitleFieldValidator();
  });

  test(
    "Less than 2 char - returns errorText",
    () {
      final result = TitleFieldValidator.validate("1");
      expect(result, validator.errorText);
      print(divider);
    },
  );

  test(
    "More than 2 char - (Validated) so returns 'null' ",
    () {
      final result = TitleFieldValidator.validate("Test Title");
      //so when field take more than 2 char field will validate so return null.
      expect(result, null);
      print(divider);
    },
  );
}
