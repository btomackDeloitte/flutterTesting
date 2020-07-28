import 'package:flutter/material.dart';
import 'package:flutter_widget_testing/constants.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({Key key}) : super(key: key);

  @override
  _MainNavPageState createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {

  final String title = 'Widget Catalog';

  List<ListTile> _widgetTiles = List<ListTile>();

  @override
  void initState() {
    for (String widgetCategory in widgets) {
      _widgetTiles.add(widgetListTile(widgetCategory));
    }
  }

  ListTile widgetListTile(String widgetTitle) {
    return ListTile(
      title: Text(
        '$widgetTitle',
        key: Key(widgetTitle),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        final String pageRoute = '/${widgetTitle.toLowerCase().replaceAll(' ', '')}';
        Navigator.pushNamed(context, pageRoute);
        }
    );
  }

  ListView widgetListView(BuildContext context) {
    return ListView.separated(
        key: Key(mainListViewKey),
        itemBuilder: (context, index) {
          return _widgetTiles[index];
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: _widgetTiles.length
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: new EdgeInsets.all(16.0),
          child: widgetListView(context),
        ),
    );
  }
}