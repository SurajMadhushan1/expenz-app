import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAddService {
  static Future<void> addUser({
    required userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required context,
  }) async {
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      SharedPreferences prefs =
          await SharedPreferences.getInstance(); // Get the instance of SharedPreferences

      await prefs.setString("userName", userName); // Save the userName
      await prefs.setString("userEmail", userEmail); // Save the userEmail
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      e.toString();
    }
  }

  static Future<bool> getUserDetails() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Get the instance of SharedPreferences

    String? userName = prefs.getString("userName"); // Get the userName
    return userName !=
        null; // Check if userName is not null and return true or false
  }
}
