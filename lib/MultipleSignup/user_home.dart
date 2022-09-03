import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("USER", style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
      ),),),
    );
  }
}
