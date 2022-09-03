import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spare_parts/NavigationPrac/data_provider/dataprovider.dart';
import 'package:spare_parts/NavigationPrac/model/box_content.dart';

class NavDetails extends StatelessWidget {

  final String id;
  late BoxContent content;

  NavDetails({required this.id}){
    content = BoxContent.fromJson(jsonDecode(id));
  }

  @override
  Widget build(BuildContext context) {

    // final content = boxContent.where((element) => element['id'].toString() == id).first;

    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Details"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Text("Name : ${content.name}", style: TextStyle(fontSize: 30),),
            SizedBox(height: 5,),
            Text("Age : ${content.age} ", style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
