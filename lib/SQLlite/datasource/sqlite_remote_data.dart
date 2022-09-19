import 'dart:convert';

import 'package:spare_parts/SQLlite/datasource/sqlite_local_data.dart';
import 'package:spare_parts/SQLlite/models/sqlite_model.dart';
import 'package:http/http.dart' as http;

class SQLiteRemote {

  SQLiteLocalDb sqLiteLocalDb = SQLiteLocalDb();

  Future<List<SQLiteModel>> getClients() async{

    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json'
    };

    try{

      final response = await http.get(
          Uri.parse('http://192.168.1.4:5000/token:qwhu67fv56frt5drfx45e/clients'),
          headers: headersList);

      if (response.statusCode >= 200 && response.statusCode < 300) {

        int counter = 0;

        final List contents = json.decode(response.body);

        // sqLiteLocalDb.addUser(contents)
        List<SQLiteModel> sql_contents = contents.map((json) => SQLiteModel.fromJson(json)).toList();

        List<SQLiteModel> the_content = [];

        while(counter < sql_contents.length){
          await sqLiteLocalDb.addUser(sql_contents[counter]);
          counter++;
        }

        List<SQLiteModel> data = await sqLiteLocalDb.getAllUsers();

        print("Here : ${data[0].fullName}");

        print(sql_contents.length);
        print(data.length);

        // print(resBody);
        return data;
      }
      else {
        print(response.reasonPhrase);
        throw Exception();
      }

    }
    catch(e){
      throw Exception();
    }
  }
}