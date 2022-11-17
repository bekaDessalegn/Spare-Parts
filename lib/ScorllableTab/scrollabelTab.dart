import 'package:flutter/material.dart';

class ScrollableTabScreen extends StatefulWidget {
  const ScrollableTabScreen({Key? key}) : super(key: key);

  @override
  State<ScrollableTabScreen> createState() => _ScrollableTabScreenState();
}

class _ScrollableTabScreenState extends State<ScrollableTabScreen> {
  List<Tab> tabs = [
    Tab(
      child: Text("Beka"),
    ),
    Tab(
      child: Text("Estifanization"),
    ),
    Tab(
      child: Text("Kemem"),
    ),
    Tab(
      child: Text("Somesing"),
    ),
    Tab(
      child: Text("Beka"),
    ),
    Tab(
      child: Text("Estifanization"),
    ),
    Tab(
      child: Text("Kemem"),
    ),
  ];
  List<Widget> values = [
    Text("Beka"),
    Text("Estifanization"),
    Text("Kemem"),
    Text("Somesing"),
    Text("Beka"),
    Text("Estifanization"),
    Text("Kemem")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Text("Scrollable Tab"),
          DefaultTabController(
              length: tabs.length,
              child: Column(
                children: [
                  SizedBox(
                    height : 50,
                    child: TabBar(
                        isScrollable: true,
                        tabs: tabs),
                  ),
                  SizedBox(
                    height: 60,
                    child: TabBarView(
                        children: values),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
