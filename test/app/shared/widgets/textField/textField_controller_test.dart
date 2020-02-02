import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:loja_hasura/app/shared/widgets/textField/textField_controller.dart';
import 'package:loja_hasura/app/app_module.dart';

void main() {
  initModule(AppModule());
  TextFieldController textfield;

  setUp(() {
    textfield = AppModule.to.get<TextFieldController>();
  });

  group('TextFieldController Test', () {
    test("First Test", () {
      expect(textfield, isInstanceOf<TextFieldController>());
    });

    test("Set Value", () {
      expect(textfield.value, equals(0));
      textfield.increment();
      expect(textfield.value, equals(1));
    });
  });
}
