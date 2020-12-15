import 'package:flutter/material.dart';
import 'firebase/welcome_screen.dart';
import 'firebase/registration_screen.dart';
import 'firebase/login_screen.dart';
import 'categories.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Walphy());
}

class Walphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.dosisTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Categories.id: (context) => Categories(),
      },
    );
  }
}
