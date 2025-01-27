import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => Welcome(), // Page d'accueil
        "/login": (BuildContext context) => Login(), // Deuxième page
        "/signup": (BuildContext context) => Signup(), // Deuxième page
      },
      initialRoute: '/', // Route initiale au lancement
    );
  }
}
