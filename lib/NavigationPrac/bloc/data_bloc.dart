import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_event.dart';
import 'package:spare_parts/NavigationPrac/bloc/data_state.dart';
import 'package:spare_parts/NavigationPrac/repositiory/data_repo.dart';

class BoxContentBloc extends Bloc<BoxContentEvent, BoxContentState>{

  final DataRepository dataRepository;

  BoxContentBloc(this.dataRepository) : super(BoxContentInitial()){
    on<LoadAllBoxContents>(_onLoadContent);
    on<LoadSearchedContents>(_onLoadSearchedContent);
    on<LoadSingleBoxContent>(_onLoadSingleBoxContent);
  }

  void _onLoadContent(LoadAllBoxContents event, Emitter emit) async{

    emit(BoxContentLoading());
    await Future.delayed(Duration(seconds: 3));

    try{
      final contents = await dataRepository.getBoxContents();
      emit(BoxContentLoaded(contents!.val!));
    }
    catch(e){
      emit(BoxContentFailed());
    }
  }

  void _onLoadSearchedContent(LoadSearchedContents event, Emitter emit) async{
    try{
      emit(BoxContentLoading());
      final contents = await dataRepository.serachBoxContent(event.value);
      emit(BoxContentLoaded(contents!.val!));
    }
    catch(e){
      emit(BoxContentFailed());
    }
  }

  void _onLoadSingleBoxContent(LoadSingleBoxContent event, Emitter emit) async{
    try{
      emit(BoxContentLoading());
      final content = await dataRepository.getBoxContent(event.id);
      emit(BoxContentLoaded(content));
    }
    catch(e){
      emit(BoxContentFailed());
    }
  }

}