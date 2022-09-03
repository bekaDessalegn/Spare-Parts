import 'package:flutter/material.dart';
import 'package:spare_parts/Responsive%20Dashboard/constants.dart';
import 'package:spare_parts/Responsive%20Dashboard/utils/my_box.dart';
import 'package:spare_parts/Responsive%20Dashboard/utils/my_tile.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultColor,
      appBar: myAppBar,
      body: Row(
        children: [
          myDrawer,
          Expanded(
            flex: 2,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return MyBox();
                        }),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return MyTile();
                        }))
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.cyan,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
