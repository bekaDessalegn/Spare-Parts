import 'package:flutter/material.dart';
import 'package:spare_parts/NavBar/buildHeader.dart';

class TabletHeader extends StatelessWidget {
  const TabletHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 17, 26, 1),
      body: buildHeader(),
    );
  }
}
