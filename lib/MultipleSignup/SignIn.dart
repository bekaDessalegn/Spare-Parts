import 'package:flutter/material.dart';
import 'package:spare_parts/MultipleSignup/admin_home.dart';
import 'package:spare_parts/MultipleSignup/user_home.dart';

class MultipleSignInPage extends StatefulWidget {

  @override
  State<MultipleSignInPage> createState() => _MultipleSignInPageState();
}

class _MultipleSignInPageState extends State<MultipleSignInPage> {

  int signinIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          signinIndex = 0;
                        });
                      },
                      child:
                      Text("Sign in as a user", style: signinIndex == 0 ? TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue) : TextStyle(color: Colors.black)),
                    ),
                    VerticalDivider(thickness: 3,),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          signinIndex = 1;
                        });
                      },
                      child: Text(
                        "Sign in as an admin",
                        style: signinIndex == 1 ? TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue) : TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(height: 50,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email or Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signinIndex == 0 ? UserHome() : AdminHome()));
                },
                child: Text(
                  "SignIn",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 120, 217),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
