import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class InternetChecker extends StatefulWidget {
  @override
  State<InternetChecker> createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  bool hasInternet = false;

  late StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState
    subscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      setState(() {
        this.hasInternet = hasInternet;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("Check Connectivity"),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Connection Status",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 30
          ),),
          SizedBox(height: 20,),
          hasInternet ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.done, color: Colors.green,),
              Text("Active Internet", style: TextStyle(color: Colors.grey),)
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.close, color: Colors.red,),
              Text("No Internet", style: TextStyle(color: Colors.grey),)
            ],
          ),
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed: () async {
               hasInternet = await InternetConnectionChecker().hasConnection;

               final text = hasInternet ? "Internet" : "No Internet";
               final color = hasInternet ? Colors.green : Colors.red;

               showSimpleNotification(
                 Text("$text",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 ),),
                 background: color,
               );
              },
              child: Text("Check Internet")),
        ],
      )),
    );
  }
}
