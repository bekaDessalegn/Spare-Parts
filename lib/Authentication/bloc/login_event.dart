import 'package:spare_parts/Authentication/model/login_bloc_model.dart';

abstract class LoginEvent{}

class LoginClientEvent extends LoginEvent{
  final LoginBlocModel loginBlocModel;
  LoginClientEvent(this.loginBlocModel);
}