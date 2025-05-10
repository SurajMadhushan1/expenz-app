import 'package:expenz/constants/colors.dart';
import 'package:expenz/screens/income_expenz_card.dart';
import 'package:expenz/services/user_add_service.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? userName;
  @override
  void initState() {
    super.initState();
    // Fetch user data from SharedPreferences or any other source

    UserAddService.getUserData().then((value) {
      setState(() {
        userName = value['userName'];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Main Column
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Column(
                  // Nested Column for the header
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: kMainColor, width: 3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/user.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, ${userName?.split(" ")[0]}',
                              // Display the first name of the user
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 16,
                                color: kBlack.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                        Spacer(flex: 2),
                        Expanded(
                          child: Icon(
                            Icons.notifications,
                            color: kMainColor,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IncomeExpenzCard(
                          containerColor: kGreen,
                          title: "Income",
                          amount: 1000,
                          image: 'assets/images/income.png',
                        ),
                        SizedBox(width: 15),
                        IncomeExpenzCard(
                          containerColor: kRed,
                          title: "Expense",
                          amount: 2000,
                          image: 'assets/images/expense.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
