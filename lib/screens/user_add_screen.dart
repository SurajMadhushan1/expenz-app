import 'package:expenz/constants/colors.dart';
import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/services/user_add_service.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserAddScreen extends StatefulWidget {
  const UserAddScreen({super.key});

  @override
  State<UserAddScreen> createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  bool _rememberme = false; // Checkbox value

  final _formKey = GlobalKey<FormState>(); // Form key
  //textediting controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your \nPersonal Details",

                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                              r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            } else if (value != _passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(18),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Text(
                              "Remember me for next time",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(
                              child: CheckboxListTile(
                                activeColor: kMainColor,
                                value: _rememberme,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberme = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              // Perform the action when the button is pressed
                              String userName = _nameController.text;
                              String userEmail = _emailController.text;
                              String password = _passwordController.text;
                              String confirmPassword =
                                  _confirmPasswordController.text;

                              await UserAddService.addUser(
                                userName: userName,
                                userEmail: userEmail,
                                password: password,
                                confirmPassword: confirmPassword,
                                context: context,
                              );
                            } else {
                              print("Form is not valid");
                            }

                            // ignore: use_build_context_synchronously
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          },
                          child: CustomButton(
                            buttonColor: kMainColor,
                            buttonText: "Next",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
