import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50),
      ),
      child: Padding(padding: EdgeInsets.all(8), child: Icon(icon)),
    );
  }
}
