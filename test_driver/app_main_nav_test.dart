import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:flutter_widget_testing/constants.dart';

void main() {
  group('Widget Testing App', () {

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    Future<void> delay([int milliseconds = 250]) async {
      await Future<void>.delayed(Duration(milliseconds: milliseconds));
    }

    test('Main Catalog List has enough entries to require scrolling', () async {

      final listFinder = find.byValueKey(mainListViewKey);
      final textInputTileFinder = find.byValueKey(widgets[0]);
      final int widgetListLength = widgets.length;
      final iconTileFinder = find.byValueKey(widgets[widgetListLength-1]);

      await driver.scrollUntilVisible(listFinder, iconTileFinder, dyScroll: -100.0);
      expect(
        await driver.getText(iconTileFinder), widgets[widgetListLength-1]
      );

      await driver.scrollUntilVisible(listFinder, textInputTileFinder, dyScroll: 100.0);
      expect(
          await driver.getText(textInputTileFinder), widgets[0]
      );
    });

    test('Testing the navigation', () async {
      for (int i = 0; i < widgets.length; i++) {
        final listFinder = find.byValueKey(mainListViewKey);
        final tileFinder = find.byValueKey(widgets[i]);
        // Make sure list is scrolled to top
        await driver.scrollUntilVisible(listFinder, tileFinder, dyScroll: 100.0);
        expect(
            await driver.getText(tileFinder), widgets[i]
        );
        await driver.tap(tileFinder);

        final appBarTitleFinder = find.text(widgets[i]);
        expect(await driver.getText(appBarTitleFinder), widgets[i]);

        await delay(750);
        await driver.tap(find.pageBack());
      }
    });
  });
}

