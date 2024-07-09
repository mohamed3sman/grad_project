import 'dart:async';

import 'package:flutter/material.dart';
import 'package:linkin/features/onboarding/onboarding_view.dart';
import 'package:linkin/config/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const OnboardingView();
      }));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
              ),
              child: Image.asset(
                AssetsData.graduation,
                width: 191,
                height: 154,
              ),
            ),
            const Text(
              "SkiLLs Hub",
              style: TextStyle(
                  color: Color(0xff4547EB),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Skill up with Skills Hub",
              style: TextStyle(color: Color(0xff292B8D), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
