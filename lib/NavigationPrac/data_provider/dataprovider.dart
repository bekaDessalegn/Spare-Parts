import 'dart:convert';

import 'package:spare_parts/NavigationPrac/model/box_content.dart';

List<Map<String, dynamic>> boxContent = [
  {
    "id": 1001,
    "name": "Beka D",
    "age": 21
  },
  {"id": 1002, "name": "Estif N", "age": 21},
  {"id": 1003, "name": "Kemem G", "age": 21},
  {"id": 1004, "name": "Nebichaw J", "age": 21},
  {"id": 1005, "name": "Z Nation", "age": 21},
  {"id": 1006, "name": "Habibiance L", "age": 21}
];

class DataProvider{
  Future<List<BoxContent>> getContents() async {

    if(true){

      List contents = boxContent;

      return contents.map((json) => BoxContent.fromJson(json)).toList();
    }
    else{
      throw Exception("Loading Contents Failed! Please try again");
    }
  }

  Future<List<BoxContent>> searchContents(String value) async {
    List contents = boxContent;

    return contents.map((json) => BoxContent.fromJson(json)).where((element) {
      final contentNameLowerCase = element.name.toLowerCase();
      final valueLowerCase = value.toLowerCase();

      return contentNameLowerCase.contains(valueLowerCase);
    }).toList();
    // contents.where((element) => element['name'].toLowerCase().contains(value.toLowerCase())).toList()
  }

  Future<List<BoxContent>> getContent(int id) async {

    if(true){

      List contents = boxContent;

      return contents.map((json) => BoxContent.fromJson(json)).where((element) {
        return element.id == id;
      }).toList();
    }
    else{
      throw Exception("Loading Content Failed! Please try again");
    }
  }

}