import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png", fit: BoxFit.cover, width: 100),

          const SizedBox(height: 10),
          Center(
            child: const Text(
              "Expenz",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,

                color: kMainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
