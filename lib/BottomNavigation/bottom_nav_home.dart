import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavHome extends StatefulWidget {
  const BottomNavHome({Key? key}) : super(key: key);

  @override
  State<BottomNavHome> createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: Center(child: Text("Bottom Nav"),),
      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          initialActiveIndex: index,
          cornerRadius: 0,
          style: TabStyle.fixedCircle,
          items: <TabItem>[
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.favorite, title: 'Favourite'),
        TabItem(icon: Icons.add),
        TabItem(icon: Icons.bookmark, title: 'Bookmark'),
        TabItem(icon: Icons.settings, title: 'Setting'),
      ],
      onTap: (value){
            setState(() {
              index = value;
            });
      },
      ),
    );
  }
}
