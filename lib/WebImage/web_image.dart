import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class WebImage extends StatefulWidget {
  @override
  State<WebImage> createState() => _WebImageState();
}

class _WebImageState extends State<WebImage> {
  @override
  void initState() {
    // getImage();
    super.initState();
  }

  String imagePath = "null";
  String? contentType;

  List<int>? _selectedFile;

  Uint8List? _bytesData;

  File? _pickedImage;
  Uint8List selectedWebImage = Uint8List(8);

  // startWebFilePicker() async {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.multiple = true;
  //   uploadInput.draggable = true;
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((event) {
  //     final files = uploadInput.files;
  //     final file = files![0];
  //     final reader = html.FileReader();
  //
  //     reader.onLoadEnd.listen((event) {
  //       setState(() {
  //         _bytesData = Base64Decoder().convert(reader.result.toString().split(",").last);
  //         _selectedFile = _bytesData!.cast();
  //       });
  //     });
  //     reader.readAsDataUrl(file);
  //   });
  // }

  Future postProducts() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Api-Key': '2S9f4e2D886aGa231caH2H44f2R25Jf487cDfaa3G',
    };
    var url = Uri.parse('http://localhost:5000/products');

    var body = {
      'productDetails':
          '{ "productName": "Somesing 38", "description":"adfsdfdsafsdf","price": 15000, "categories": ["Categorylkh"], "commissionRate": 15 }'
    };

    // var dio = Dio();
    //
    // var formData = FormData.fromMap({
    //   'productName': 'wendux',
    //   'price': 25000,
    //   'commissionRate': 2,
    //   // 'mainImage' : await MultipartFile.fromBytes(_selectedFile!),
    // });
    // Response response = await dio.post('http://localhost:5000/products', data: formData, options: Options(
    //   headers: {
    //     'Accept': '*/*',
    //     'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    //     'Api-Key': '2S9f4e2D886aGa231caH2H44f2R25Jf487cDfaa3G',
    //   }
    // ));

    // print(response.data);

    // var formData = FormData.fromMap({
    //   'mainImage' : await MultipartFile.fromBytes(_selectedFile!),
    // });

    var req = http.MultipartRequest('POST', url);
    req.headers.addAll(headersList);
    req.files
        .add(await http.MultipartFile.fromBytes('mainImage', _selectedFile!, contentType: MediaType("application", "json"), filename: "Any_name"));
    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    var data = json.decode(resBody);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(data);
    } else {
      print(data);
    }
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image has been picked");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var webImage = await image.readAsBytes();
        var selected = File(image.path);
        setState(() {
          selectedWebImage = webImage;
          _pickedImage = selected;
          contentType = image.mimeType;
        });
      } else {
        print("No image has been picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  Future getImage() async {
    var headersList = {
      'Accept': '*/*',
      'Api-Key': '2S9f4e2D886aGa231caH2H44f2R25Jf487cDfaa3G',
    };
    var url =
        Uri.parse('http://localhost:5000/products/634ef1232816966ab5f9fb11');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await http.get(url, headers: headersList);
    final resBody = res.body;

    var data = json.decode(resBody);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      setState(() {
        imagePath = data["mainImage"]["path"];
      });
      print(data);
    } else {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEB IMAGE"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _pickImage();
                // startWebFilePicker();
              },
              child: Text("Select Image")),
          SizedBox(
            height: 50,
          ),
          // Image.network("http://localhost:5000/images/products/TFbLaYSdhl6x4MOolgFYmHJjH3iEphTs", width: 200, height: 200, fit: BoxFit.cover,),
          ElevatedButton(
              onPressed: () async {
                // var data = await readExifFromBytes(selectedWebImage, details: false);
                // final fileBytes = _pickedImage!.readAsBytesSync();
                // final data = await readExifFromBytes(fileBytes);
                // // print(selectedWebImage);
                // print("The print");
                // print(data);
                // if (data.isEmpty) {
                //   print("No EXIF information found");
                //   return;
                // }
                //
                // if (data.containsKey('JPEGThumbnail')) {
                //   print('File has JPEG thumbnail');
                //   data.remove('JPEGThumbnail');
                // }
                // if (data.containsKey('TIFFThumbnail')) {
                //   print('File has TIFF thumbnail');
                //   data.remove('TIFFThumbnail');
                // }
                //
                // for (final entry in data.entries) {
                //   print("${entry.key}: ${entry.value}");
                // }
                print(contentType);
                // postProducts();
                // print(_bytesData);
                // print(File.fromRawPath(_bytesData!));
                // print(_pickedImage!.path);
                // getImage();
              },
              child: Text("Print")),
        ],
      ),
    );
  }
}
