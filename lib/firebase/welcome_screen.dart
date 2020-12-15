import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wallphy/categories.dart';
import '../others/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
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
                height: 20.0,
              ),
              ColorizeAnimatedTextKit(
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
              SizedBox(
                height: 80.0,
              ),
              RoundedButton(
                color: Colors.redAccent,
                text: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Categories.id);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
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
