import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spare_parts/Authentication/bloc/login_bloc.dart';
import 'package:spare_parts/Authentication/bloc/login_event.dart';
import 'package:spare_parts/Authentication/bloc/login_state.dart';
import 'package:spare_parts/Authentication/model/login_bloc_model.dart';
import 'package:spare_parts/Authentication/screen/login_dashboard.dart';
import 'package:spare_parts/Authentication/screen/widgets/loading_widget.dart';
import 'package:spare_parts/main.dart';

class LoginBlocPage extends StatefulWidget {

  @override
  State<LoginBlocPage> createState() => _LoginBlocPageState();
}

class _LoginBlocPageState extends State<LoginBlocPage> {
  final _formkey = GlobalKey<FormState>();

  final username = TextEditingController();

  final password = TextEditingController();

  final loginInfo = LoginInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (_, state){
            if(state is LoginFailedState){
              buildErrorLayout();
            }
            else if(state is LoginPassedState){
              clearTextData();
              loginInfo.isLoggedIn = true;
              context.go('/sqlite');
            }
          },
            builder: (_, state){
              if(state is LoginLoadingState){
                return LoadingWidget(child: buildInitialInput());
              }
              else{
                return buildInitialInput();
              }
            }),
      ),
    );
  }

  Widget buildInitialInput() => SingleChildScrollView(
    child: Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("LOGIN", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: username,
              validator: (value){
                if(value!.isEmpty){
                  return "Value can not be empty";
                }
                else{
                  return null;
                }
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: "",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Nunito',
                  letterSpacing: 0.1,
                ),
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Nunito',
                  letterSpacing: 0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: password,
              validator: (value){
                if(value!.isEmpty){
                  return "Value can not be empty";
                }
                else{
                  return null;
                }
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: "",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Nunito',
                  letterSpacing: 0.1,
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Nunito',
                  letterSpacing: 0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                    BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    final login = BlocProvider.of<LoginBloc>(context);
                    login..add(LoginClientEvent(LoginBlocModel(username: username.text, password: password.text)));
                  }
                }, child: Text("Login")),
          )
        ],
      ),
    ),
  );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the correct credentials'),
        ),
      );

  clearTextData() {
    username.clear();
    password.clear();
  }
}
