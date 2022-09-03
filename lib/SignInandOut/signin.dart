import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:spare_parts/SignInandOut/signup.dart';
import 'package:spare_parts/SignInandOut/widgets/otherPlatformAccount.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Join Gofere",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 46, 46, 46),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text("Sign up", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign in to your account",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
            SizedBox(
              height: 15,
            ),
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Log in",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 120, 217),
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      value: isRememberMeChecked,
                      onChanged: (v) {
                        setState(() {
                          isRememberMeChecked = v!;
                        });
                      },
                    ),
                    Text("Remember me"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("or sign in with"),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              OtherPlatfomr(
                "Facebook",
                Iconify(
                  SimpleIcons.facebook,
                  color: Color.fromARGB(255, 2, 120, 217),
                  size: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OtherPlatfomr(
                "Google",
                Iconify(
                  Logos.google_icon,
                  size: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OtherPlatfomr(
                "Twitter",
                Iconify(
                  Logos.twitter,
                  size: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  "create an account",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 93, 169),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ])
          ],
        ),
      )),
    );
  }
}
