import 'package:flutter/material.dart';

Widget semiBoldText({required String value, required double size}){
  return Text(value, style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500
  ),);
}