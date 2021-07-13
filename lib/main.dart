import 'package:flutter/material.dart';
import 'package:morept_fitness_app/screens/auth/loginScreen/login_screen.dart';
import 'package:morept_fitness_app/screens/auth/signupScreen/signup_screen.dart';
import 'package:morept_fitness_app/screens/homeScreen/home_screen.dart';
import 'package:morept_fitness_app/screens/sliderScreen/slider_screen.dart';
import 'package:morept_fitness_app/screens/splashScreen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'More PT Fitness', // web link: https://morept.world/
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        SliderScreen.routeName: (_) => SliderScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
