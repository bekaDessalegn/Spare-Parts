import 'package:flutter/material.dart';

Widget boldText({required String value, required double size}){
  return Text(value, style: TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold
  ),);
}