import 'package:flutter/material.dart';
import 'package:spare_parts/LoggedIn/LoginPage.dart';
import 'package:spare_parts/LoggedIn/shared_preference_service.dart';

class LoggedInHomePage extends StatelessWidget {

  final _prefs = PrefService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Home", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              _prefs.removeCache();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }, child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
