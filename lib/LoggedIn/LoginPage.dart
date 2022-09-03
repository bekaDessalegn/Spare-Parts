import 'package:flutter/material.dart';
import 'package:spare_parts/LoggedIn/LoggedInHomePage.dart';
import 'package:spare_parts/LoggedIn/shared_preference_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey = GlobalKey<FormState>();

  final _prefs = PrefService();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextFormField(
                controller: email,
                validator: (value){
                  if(value!.isEmpty){
                    return "Value can not be empty";
                  }
                  else{
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
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
                  labelText: "Email",
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
              SizedBox(height: 10,),
              TextFormField(
                controller: password,
                validator: (value){
                  if(value!.isEmpty){
                    return "Value can not be empty";
                  }
                  else{
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
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
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  _prefs.createCache(password.text).whenComplete(() =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoggedInHomePage())));
                }
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
