import 'package:flutter/material.dart';

class AppBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('App Bars'),
      ),
      body: Center(
        child: SizedBox(
          height: 10.0,
        ),
      ),
    );
  }
}