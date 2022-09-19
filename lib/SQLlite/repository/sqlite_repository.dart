import 'package:spare_parts/SQLlite/datasource/sqlite_remote_data.dart';
import 'package:spare_parts/SQLlite/models/sqlite_model.dart';

class SQLiteRepository {
  SQLiteRemote sqLiteRemote;
  SQLiteRepository(this.sqLiteRemote);

  Future<List<SQLiteModel>> getClients() async {
    try{
      final clients = await sqLiteRemote.getClients();
      return clients;
    }
    catch(e){
      throw Exception();
    }
  }
}