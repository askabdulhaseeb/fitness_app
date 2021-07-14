import 'package:flutter/material.dart';
import 'screens/auth/loginScreen/login_screen.dart';
import 'screens/auth/signupScreen/signup_screen.dart';
import 'screens/homeScreen/home_screen.dart';
import 'screens/introSliderScreen/intro_slider_screen.dart';
import 'screens/splashScreen/splash_screen.dart';

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
        primaryColor: Colors.blue,
        splashColor: Colors.blue[200],
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.routeName: (_) => const SplashScreen(),
        IntroSliderScreen.routeName: (_) => const IntroSliderScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
