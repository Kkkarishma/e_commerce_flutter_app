import 'package:ecommerce_int2/screens/auth/registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RegistrationWidget contains four input fields and one button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: RegistrationPage(),
    ));

    final inputFieldsCount = find.byType(TextField);

    expect(inputFieldsCount, findsNWidgets(2));
  });
}

