import 'package:flutter/material.dart';
import 'package:spare_parts/NavBar/buildHeader.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 17, 26, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
    );
  }
}
