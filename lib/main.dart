import 'package:flutter/material.dart';
import 'package:flutter_widget_testing/main_nav.dart';
import 'package:flutter_widget_testing/scenes/text_inputs.dart';
import 'package:flutter_widget_testing/scenes/buttons.dart';
import 'package:flutter_widget_testing/scenes/checkboxes.dart';
import 'package:flutter_widget_testing/scenes/radio_buttons.dart';
import 'package:flutter_widget_testing/scenes/date_and_time_pickers.dart';
import 'package:flutter_widget_testing/scenes/sliders.dart';
import 'package:flutter_widget_testing/scenes/switches.dart';
import 'package:flutter_widget_testing/scenes/progress_indicators.dart';
import 'package:flutter_widget_testing/scenes/app_bars.dart';
import 'package:flutter_widget_testing/scenes/gridviews.dart';

void main() {
  runApp(WidgetTesting());
}

class WidgetTesting extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavPage(),
        '/textinput': (context) => TextInput(),
        '/buttons': (context) => Buttons(),
        '/checkboxes': (context) => Checkboxes(),
        '/radiobuttons': (context) => RadioButtons(),
        '/dateandtimepickers': (context) => DateAndTimePickers(),
        '/sliders': (context) => Sliders(),
        '/switches': (context) => Switches(),
        '/progressindicators': (context) => ProgressIndicators(),
        '/appbars': (context) => AppBars(),
        '/gridviews': (context) => GridViews(),
      },
    );
  }
}

