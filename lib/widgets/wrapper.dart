import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool
  isLoggedIn; // This should be set based on your authentication logic
  const Wrapper({super.key, required this.isLoggedIn});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoggedIn
        ? MainScreen()
        : OnboardingScreen(); // Check if the user is logged in or not
  }
}
