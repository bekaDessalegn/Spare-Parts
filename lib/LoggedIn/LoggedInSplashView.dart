import 'package:flutter/material.dart';
import 'package:spare_parts/LoggedIn/LoggedInHomePage.dart';
import 'package:spare_parts/LoggedIn/LoginPage.dart';
import 'package:spare_parts/LoggedIn/shared_preference_service.dart';

class LoggedInSplashView extends StatefulWidget {
  const LoggedInSplashView({Key? key}) : super(key: key);

  @override
  State<LoggedInSplashView> createState() => _LoggedInSplashViewState();
}

class _LoggedInSplashViewState extends State<LoggedInSplashView> {

  final _prefs = PrefService();

  @override
  void initState() {
    // TODO: implement initState
    _prefs.readCache().then((value) {
      if(value != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoggedInHomePage()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
