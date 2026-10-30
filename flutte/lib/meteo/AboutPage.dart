import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('A propos')),
      body: Column(
        children: [
          Text("A propos de nous"),
          SizedBox(height: 6),
          Text('Lorem..'),
        ],
      ),
    );
  }
}
