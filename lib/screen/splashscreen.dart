
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/loginscreen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState(){
    super.initState();
    gotoLogin();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Flutter Basics',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
    );
  }

  void gotoLogin(){
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ScreenLogin())
      );
    });
  }
}