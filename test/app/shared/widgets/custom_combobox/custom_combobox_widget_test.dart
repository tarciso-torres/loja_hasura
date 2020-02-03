import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:loja_hasura/app/shared/widgets/custom_combobox/custom_combobox_widget.dart';

main() {
  testWidgets('CustomComboboxWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CustomComboboxWidget(items: <Model>[], itemSelecionado: null, onChange: (Model) {},)));
    final textFinder = find.text('CustomCombobox');
    expect(textFinder, findsOneWidget);
  });
}
