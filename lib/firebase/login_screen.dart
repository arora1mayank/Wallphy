import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/wallphy/lib/others/rounded_button.dart';
import '../others/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../categories.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Flexible(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png.png'),
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Wallphy",
                    "Wallphy",
                    "Wallphy",
                  ],
                  textStyle: GoogleFonts.indieFlower(
                    textStyle: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Horizon",
                        color: Colors.blueAccent),
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter login',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              text: 'Login',
              color: Colors.redAccent,
              onPressed: () async {
                try {
                  final loginUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (loginUser != null) {
                    Navigator.pushNamed(context, Categories.id);
                  }
                } catch (e) {
                  print(e);
                  print(email);
                  print(password);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
