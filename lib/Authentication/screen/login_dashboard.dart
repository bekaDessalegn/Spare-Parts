import 'package:flutter/material.dart';

class LoginBlocDashboard extends StatelessWidget {
  const LoginBlocDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("D A S H B O A R D"),
      ),
      body: Center(child: Text("HOME", style: TextStyle(fontSize: 30),),),
    );
  }
}
