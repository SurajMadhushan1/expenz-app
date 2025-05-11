import 'package:expenz/constants/colors.dart';
import 'package:expenz/models/expense_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int _selectedIndex = 0;
  ExpenseCategory _expenseCategory = ExpenseCategory.food;
  IncomeCategory _incomeCategory = IncomeCategory.salary;

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime _selectedDate = DateTime.now(); //default date is today
  DateTime _selectedTime = DateTime.now(); //default time is now

  //dispose method to clear the controllers
  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedIndex == 0 ? kRed : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.12,
                                vertical: 8,
                              ),
                              child: Text(
                                'Expense',
                                style: TextStyle(
                                  color: _selectedIndex == 0 ? kWhite : kBlack,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedIndex == 1 ? kGreen : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.12,
                                vertical: 8,
                              ),
                              child: Text(
                                'Income',
                                style: TextStyle(
                                  color: _selectedIndex == 1 ? kWhite : kBlack,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.09,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How much ?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0',
                            hintStyle: TextStyle(color: kWhite),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 20,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.31,
                  ),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonFormField(
                            items:
                                _selectedIndex == 0
                                    ? ExpenseCategory.values
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                color: kBlack,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : IncomeCategory.values
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.name,
                                              style: TextStyle(
                                                color: kBlack,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedIndex == 0
                                    ? _expenseCategory =
                                        value as ExpenseCategory
                                    : _incomeCategory = value as IncomeCategory;
                              });
                            },
                            value:
                                _selectedIndex == 0
                                    ? _expenseCategory
                                    : _incomeCategory,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              labelStyle: TextStyle(
                                color: kBlack,
                                fontSize: 16,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide(
                                  color: kMainColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(color: kGrey, fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide(color: kGrey, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(color: kGrey, fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide(color: kGrey, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              labelStyle: TextStyle(color: kGrey, fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide(color: kGrey, width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2000, 1, 1),
                                    lastDate: DateTime(3000, 12, 31),
                                    initialDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedDate = value;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: kWhite,
                                          size: 30,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Select Date',
                                          style: TextStyle(
                                            color: kWhite,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                DateFormat.yMMMd().format(_selectedDate),
                                style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            // time picker
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    setState(() {
                                      if (value != null) {
                                        setState(() {
                                          _selectedTime = DateTime(
                                            _selectedDate.year,
                                            _selectedDate.month,
                                            _selectedDate.day,
                                            value.hour,
                                            value.minute,
                                          );
                                        });
                                      }
                                    });
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: kWhite,
                                          size: 30,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Select Time',
                                          style: TextStyle(
                                            color: kWhite,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                DateFormat.jm().format(_selectedTime),
                                style: TextStyle(
                                  color: kGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(color: kGrey, thickness: 2),
                          SizedBox(height: 10),
                          CustomButton(
                            buttonColor: _selectedIndex == 0 ? kRed : kGreen,
                            buttonText: "Add",
                          ),
                        ],
                      ),
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
