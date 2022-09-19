import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_event.dart';
import 'package:spare_parts/SQLlite/blocs/sqlite_state.dart';
import 'package:spare_parts/SQLlite/repository/sqlite_repository.dart';

class SQLiteBloc extends Bloc<SQLiteEvent, SQLiteState>{

  final SQLiteRepository sqLiteRepository;

  SQLiteBloc(this.sqLiteRepository) : super(SQLiteInitialState()){
    on<LoadSQliteEvent>(_onLoadSQliteEvent);
  }

  void _onLoadSQliteEvent(LoadSQliteEvent event, Emitter emit) async {
    emit(SQLiteLoadingState());
    try{
      final sqlite_contents = await sqLiteRepository.getClients();
      emit(SQLiteLoadedState(sqlite_contents));
    }
    catch(e){
      emit(SQLiteFailedState());
    }
  }

}