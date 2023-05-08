import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_register/providers/authProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<UserProvider>().loadAuthLocal();

    Timer(const Duration(seconds: 5), () {
      // print(context.read<UserProvider>().user.uid);
      if (context.read<UserProvider>().user.uid != null)
        Navigator.pushReplacementNamed(context, 'mainpage');
      else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/gif/splash.gif'),
      ),
    );
  }
}



class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      // After 3 seconds, navigate to the home screen.
      Navigator.pushReplacementNamed(context, 'splash');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200, // set width to 200
          height: 200, // set height to 200
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/p3.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
