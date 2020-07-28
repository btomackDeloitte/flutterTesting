import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_widget_testing/scenes/text_inputs.dart';
import 'package:flutter_widget_testing/constants.dart';

// Test Inputs widget tests
void main() {

  // Test that 3 input fields render
  testWidgets('Testing TextFormFields Exist and are blank', (WidgetTester tester) async {

    // Let's pump the widgets ( build and render the widget we are going to provide)
    // Note that TextInput is in a Wrapper so that it starts with MaterialApp on top
    await tester.pumpWidget(TextInputWrapper());

    // Let's find the 3 text inputs (TextFormFields) and that they have correct labels
    final Finder userNameFieldKey = find.byKey(Key(USER_NAME));
    expect(userNameFieldKey, findsOneWidget);
    expect(find.text('User Name'), findsOneWidget);

    final Finder emailFieldKey = find.byKey(Key(USER_EMAIL));
    expect(emailFieldKey, findsOneWidget);
    expect(find.text('Email'), findsOneWidget);

    final Finder passwordFieldKey = find.byKey(Key(USER_PWORD));
    expect(passwordFieldKey, findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    WidgetPredicate widgetInitValPredicate = (Widget widget) => widget is TextFormField && widget.initialValue == "";
    expect(find.byWidgetPredicate(widgetInitValPredicate), findsNWidgets(3));
  });

  // Required Fields
  testWidgets('All TextFormFields are required', (WidgetTester tester) async {
    await tester.pumpWidget(TextInputWrapper());

    final Finder submitFinder = find.widgetWithText(RaisedButton, 'Submit');
    await tester.tap(submitFinder);
    await tester.pump();

    expect(find.text('Please enter your user name.'), findsOneWidget);
    expect(find.text('Invalid email address.'), findsOneWidget);
    expect(find.text('Invalid password.'), findsOneWidget);
  });

}

// Wrap the TextInput() in a material app
class TextInputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextInput(),
    );
  }
}