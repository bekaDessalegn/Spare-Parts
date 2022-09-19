import 'package:flutter/material.dart';

Widget sidebarBoxWidget(){
  return Container(
    width: 278,
    height: 62,
    child: Row(
      children: [
        Icon(Icons.home_filled, size: 30,),
        SizedBox(width: 10,),
        Text("Home", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),)
      ],
    ),
  );
}