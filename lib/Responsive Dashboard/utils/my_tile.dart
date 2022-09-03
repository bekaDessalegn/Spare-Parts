import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      color: Colors.greenAccent,
      height: 80,
    );
  }
}
