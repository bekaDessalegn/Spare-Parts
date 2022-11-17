import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class NewEntryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryPage>
    with TickerProviderStateMixin {



  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

  List url = [
    "https://t4.ftcdn.net/jpg/02/30/48/93/360_F_230489387_31KpfvoRGhWggo7dKd01xWvO8Y9RMGRG.webp",
    "https://images.unsplash.com/photo-1611558709798-e009c8fd7706?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1601288496920-b6154fe3626a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1507114845806-0347f6150324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1606893995103-a431bce9c219?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80"
  ];

  List url2 = [
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
    "https://images.unsplash.com/photo-1654797314248-c41c8a8cf35b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&h=800&q=80",
  ];

  List<Widget> values = [];

  void someiing(){
    print(_tabController.index);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      someiing();
    });
   values = [
      Column(
        children: [
          Text("The Network image"),
          SizedBox(height: 20,),
          SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: url.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProgressiveImage(
                    placeholder: AssetImage('images/default.png'),
                    // size: 1.87KB
                    thumbnail: NetworkImage(url[index]),
                    // size: 1.29MB
                    image: NetworkImage(url[index]),
                    height: 300,
                    width: 300,
                  );
                }
            ),
          )
        ],
      ),
     Column(
       children: [
         Text("The Network image"),
         SizedBox(height: 20,),
         SizedBox(
           height: 320,
           child: ListView.builder(
               itemCount: url.length,
               scrollDirection: Axis.horizontal,
               shrinkWrap: true,
               itemBuilder: (context, index) {
                 return Container(
                   child: ProgressiveImage(
                     placeholder: AssetImage('images/default.png'),
                     // size: 1.87KB
                     thumbnail: NetworkImage(url[index]),
                     // size: 1.29MB
                     image: NetworkImage(url[index]),
                     height: 300,
                     width: 500,
                   ),
                 );
               }
           ),
         )
       ],
     ),
      Text(""),
      Text(""),
      Text(""),
      Text(""),
      Text("")
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            if (_tabController.index > 0) {
                              _tabController.animateTo(_tabController.index - 1);
                            } else {
                              // Scaffold.of(context).showSnackBar(SnackBar(
                              //   content: Text("Can't go back"),
                              // ));
                            }
                          },
                        ),
                        Expanded(
                          child: TabBar(
                            isScrollable: true,
                            controller: _tabController,
                            labelStyle: TextStyle(color: Colors.black),
                            unselectedLabelColor: Colors.black,
                            labelColor: Colors.blue,
                            tabs: tabs
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            if (_tabController.index + 1 < tabs.length) {
                              _tabController.animateTo(_tabController.index + 1);
                            } else {
                              // Scaffold.of(context).showSnackBar(SnackBar(
                              //   content: Text("Can't move forward"),
                              // ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60,),
            SizedBox(
              height: 500,
              child: TabBarView(
                  controller: _tabController,
                  children: values),
            )
          ],
        ),
      ),
    );
  }
}