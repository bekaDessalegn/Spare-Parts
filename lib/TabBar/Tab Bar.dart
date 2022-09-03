import 'package:flutter/material.dart';
import 'package:spare_parts/TabBar/first_page.dart';
import 'package:spare_parts/TabBar/second_page.dart';
import 'package:spare_parts/TabBar/third_page.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: ("Tab 1"), icon: Icon(Icons.table_bar_rounded),),
            Tab(text: ("Tab 2"), icon: Icon(Icons.ac_unit_rounded),),
            Tab(text: ("Tab 3"), icon: Icon(Icons.adb_outlined),),
          ]),
        ),
        body: TabBarView(children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ]),
      ),
    );
  }
}
