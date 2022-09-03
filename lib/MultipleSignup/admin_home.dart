import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ADMIN", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),),),
    );
  }
}