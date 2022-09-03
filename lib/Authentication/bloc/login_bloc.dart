import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spare_parts/Authentication/bloc/login_event.dart';
import 'package:spare_parts/Authentication/bloc/login_state.dart';
import 'package:spare_parts/Authentication/repository/login_bloc_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final LoginBlocRepository loginBlocRepository;
  LoginBloc(this.loginBlocRepository) : super(LoginInitialState()){
    on<LoginClientEvent>(_onLoginClientEvent);
  }

  void _onLoginClientEvent(LoginClientEvent event, Emitter emit) async{

    emit(LoginLoadingState());
    await Future.delayed(Duration(seconds: 2));

    try{
      await loginBlocRepository.loginClient(event.loginBlocModel);
      emit(LoginPassedState());
    }
    catch(e){
      emit(LoginFailedState());
    }
  }


}