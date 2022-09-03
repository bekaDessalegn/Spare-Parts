import 'package:spare_parts/Authentication/dataprovider/login_bloc_data.dart';
import 'package:spare_parts/Authentication/model/login_bloc_model.dart';

class LoginBlocRepository{
  LoginBlocData loginBlocData;
  LoginBlocRepository(this.loginBlocData);

  Future loginClient(LoginBlocModel loginBlocModel) async{
    try{
      await loginBlocData.loginClient(loginBlocModel);
    }
    catch(e){
      throw Exception();
    }
  }
}