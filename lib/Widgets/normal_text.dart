import 'package:flutter/material.dart';

Widget normalText({required String value, required double size}){
  return Text(value, style: TextStyle(
    fontSize: size,
  ),);
}