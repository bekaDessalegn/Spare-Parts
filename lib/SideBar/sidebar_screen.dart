import 'package:flutter/material.dart';
import 'package:spare_parts/SideBar/sidebar_box_widget.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: w/2,
        child: Column(
          children: [
            SizedBox(
              height: h / 10,
            ),
            Icon(
              Icons.ac_unit,
              size: 60,
            ),
            SizedBox(
              height: h / 15,
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return sidebarBoxWidget();
            }),
          ],
        ),
      ),
    );
  }
}
