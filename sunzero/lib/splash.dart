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
