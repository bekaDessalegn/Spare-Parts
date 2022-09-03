import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spare_parts/Authentication/bloc/login_event.dart';
import 'package:spare_parts/Authentication/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(super.initialState);

}