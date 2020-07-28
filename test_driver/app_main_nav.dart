// "instrumented" version of the app. The instrumentation
// allows you to "drive" the app and record performance
// profiles from a test suite.

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_widget_testing/main.dart' as app;

void main() {
  enableFlutterDriverExtension();

  app.main();
}