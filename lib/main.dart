import 'package:flutter/material.dart';
import 'package:sign_in_screen_2/screens/login.dart';
import 'package:sign_in_screen_2/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Boss Aliyu LogIn Screen Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogInScreen(),
        routes: {
          WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        });
  }
}
