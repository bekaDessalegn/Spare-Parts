import 'package:spare_parts/SQLlite/models/sqlite_model.dart';

abstract class SQLiteState {}

class SQLiteInitialState extends SQLiteState {}

class SQLiteLoadingState extends SQLiteState {}

class SQLiteLoadedState extends SQLiteState {
  List<SQLiteModel> sqLiteContents;
  SQLiteLoadedState(this.sqLiteContents);
}

class SQLiteFailedState extends SQLiteState {}