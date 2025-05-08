import 'package:expenz/services/user_add_service.dart';
import 'package:expenz/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance(); // Initialize SharedPreferences
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserAddService.getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          bool isLoggedIn =
              snapshot.data ?? false; // Check if user is logged in
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(
              isLoggedIn: isLoggedIn,
            ), // Pass the login status to the wrapper
            theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Inter"),
          );
        }
      },
    );
  }
}
