import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/wallphy/lib/others/rounded_button.dart';
import '../others/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

final _firestore = Firestore.instance;

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String phone;
  String userName;
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
              height: 5.0,
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
                    ),
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
              height: 10.0,
            ),
            TextField(
              //keyboardType: TextInputType.phone,
              onChanged: (value) {
                userName = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter username',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                phone = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Phone',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter email',
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
              color: Colors.blue,
              text: 'Register',
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  _firestore.collection('contacts').add({
                    'email': email,
                    'phone': phone,
                    'username': userName,
                  });
                  if (newUser != null) {
                    Navigator.pushNamed(context, Categories.id);
                  }
                } catch (e) {
                  print(e);
                  print(email);
                  print(password);
                  print(phone);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
