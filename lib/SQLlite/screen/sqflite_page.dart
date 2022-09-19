import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_bloc.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_event.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_state.dart';

class SQLitePage extends StatefulWidget {
  const SQLitePage({Key? key}) : super(key: key);

  @override
  State<SQLitePage> createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {

  @override
  void initState() {
    // TODO: implement initState
    // refresh();
    super.initState();
  }

  Future refresh() async{
    while(true){
      final sqliteBloc = BlocProvider.of<SQLiteBloc>(context);
      sqliteBloc.add(LoadSQliteEvent());
      await Future.delayed(Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 50.0, top: 50),
        child: BlocBuilder<SQLiteBloc, SQLiteState>(
          builder: (_, state){
            if(state is SQLiteFailedState){
              return Center(child: Text("Failed"),);
            }
            else if(state is SQLiteLoadedState){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : ${state.sqLiteContents[12].fullName}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Phone : ${state.sqLiteContents[12].phone}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Email : ${state.sqLiteContents[12].email}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              );
            }
            else if(state is SQLiteLoadingState){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return Center(child: Text("Should never happen"),);
            }
          },
        ),
      ),
    );
  }
}
