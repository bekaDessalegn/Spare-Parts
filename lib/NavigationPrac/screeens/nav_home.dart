import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_bloc.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_event.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_state.dart';
import 'package:spare_parts/NavigationPrac/model/box_content.dart';
import 'package:spare_parts/NavigationPrac/screeens/nav_content_details.dart';

class NavHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("N A V  H O M E"),
      ),
      body: BlocBuilder<BoxContentBloc, BoxContentState>(
        builder: (_, boxContentState){
          if(boxContentState is BoxContentLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(boxContentState is BoxContentLoaded){
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(child: Text("List of Names", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      final searchContent = BlocProvider.of<BoxContentBloc>(context);
                      searchContent.add(LoadSearchedContents(value));
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                      ),
                      hintText: "Search....",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey,

                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 450,
                    color: Colors.grey[200],
                    child: ListView.builder(
                        itemCount: boxContentState.contents.length,
                        itemBuilder: (context, index) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (){
                                context.goNamed('details', params: {'id': boxContentState.contents[index].id.toString()},);
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => NavDetails(name: boxContent[index].name, age: boxContent[index].age)));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Column(
                                  children: [
                                    Text("Name : ${boxContentState.contents[index].name}"),
                                    SizedBox(height: 20,),
                                    Text("Age: ${boxContentState.contents[index].age}")
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
          if(boxContentState is BoxContentFailed){
            return Column(
              children: [
                Center(child: Text("Loading Contents Failed! Please try again", style: TextStyle(fontSize: 25, color: Colors.blue),),),
                Icon(Icons.cameraswitch_rounded)
              ],
            );
          }
          return Center(child: Text("Should never happen!"),);
        },
      ),
    );
  }
}
