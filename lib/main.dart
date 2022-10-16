import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:evena/onBoarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evena',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 800,
        duration: 750,//000,
        backgroundColor: Colors.purple,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1750),
        splash: Container(
          color: Colors.purple,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 5),
              const Text("Evena", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              const SizedBox(height: 15),
              const Text("Event Planning", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        nextScreen: const OnBoarding(),
      ),
    );
  }
}