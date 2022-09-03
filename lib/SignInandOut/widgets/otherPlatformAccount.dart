import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

Widget OtherPlatfomr(String name, Widget icon) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20,
          ),
          Text(
            "Sign in with $name",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
