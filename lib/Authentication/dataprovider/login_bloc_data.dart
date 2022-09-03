import 'dart:convert';

import 'package:spare_parts/Authentication/model/client_model.dart';
import 'package:spare_parts/Authentication/model/login_bloc_model.dart';

class LoginBlocData {
  Future loginClient(LoginBlocModel loginBlocModel) async{

      if(loginBlocModel.username == 'Beka D' && loginBlocModel.password == 'asdfghjk'){

      }
      else{
        throw Exception();
      }
  }
}