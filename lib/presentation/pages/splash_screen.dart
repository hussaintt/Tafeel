import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tafeel/presentation/pages/list_of_users.dart';
import 'package:tafeel/utils/constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Delay and navigate
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ListOfUsers()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: mainBackground),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 200),
              Image.asset(
                'assets/images/tafeel_logo.png',
                width: 300,
                height: 300,
              ),
              const Spacer(),
              const SizedBox(height: 10),
            ],
          )
              .animate(delay: 700.ms, autoPlay: true)
              .slideY(begin: -5, end: 0, duration: 300.ms)
              .then(delay: 100.ms)
              .shake(duration: 200.ms)
              .shimmer(duration: 200.ms),
        ),
      ),
    );
  }
}
