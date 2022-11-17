import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

class WebImage2 extends StatefulWidget {
  const WebImage2({Key? key}) : super(key: key);

  @override
  State<WebImage2> createState() => _WebImage2State();
}

class _WebImage2State extends State<WebImage2> {

  Uint8List? imagebytes;

  Future upload() async {
    String url = 'http://localhost:8080/blog_upload';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    // imagebytes = await image.readAsBytes();
    List<int> listData = imagebytes!.cast();
    request.files.add(http.MultipartFile.fromBytes('field_name', listData ,
        filename:'myFile.jpg'));
    request.fields['name'] = 'Mehran Ullah Khan';
    request.fields['country'] = 'Pakistan';
    var response = await request.send();
  }

  // Future pickImage() async {
  //   image = await ImagePicker().pickImage(source: ImageSource.gallery);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEB IMAGE"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
          }, child: Text("Select image")),
          ElevatedButton(onPressed: (){

          }, child: Text("Post")),
        ],
      ),
    );
  }
}
