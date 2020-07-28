import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
            'Buttons',
            key: Key('AppBarTitle'),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 10.0,
        ),
      ),
    );
  }
}