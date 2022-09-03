import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingHompePage extends StatelessWidget {
  const OnBoardingHompePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool("showHome", false);
          }, icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("HomePage", style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
