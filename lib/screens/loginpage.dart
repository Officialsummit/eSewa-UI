import 'dart:io';

import 'package:class_01/constants/constants.dart';
import 'package:class_01/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idControlller = TextEditingController();

  final TextEditingController pdControlller = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            child: AlertDialog(
              content: Text("Are you sure to exit?"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text("Yes"),
                  color: Colors.red,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"),
                  color: Colors.green,
                ),
              ],
            ));
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 70, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: logoWidget(),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 25, color: Colors.grey.shade600),
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("eSewa ID (mobile/email)"),
                TextField(
                  controller: idControlller,
                  decoration: kTextFieldDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password/MPIN"),
                TextField(
                  controller: pdControlller,
                  decoration: kTextFieldDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          activeColor: kThemeColor,
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Forgot MPIN ?",
                      style: TextStyle(
                          color: kThemeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () async {
                        if (idControlller.text != "" &&
                            pdControlller.text != "") {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String authId = prefs.getString("id");
                          String authPass = prefs.getString("password");
                          print(authId + " " + authPass);
                          if (idControlller.text == authId &&
                              pdControlller.text == authPass) {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => HomePage()));
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                child: AlertDialog(
                                  content: Text(
                                      "Wrong credential! Please try again."),
                                ));
                          }
                        } else {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              child: AlertDialog(
                                content: Text("please fill all data"),
                              ));
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: kThemeColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegistrationPage())),
                    child: Text(
                      "Register For Free",
                      style: TextStyle(
                        fontSize: 18,
                        color: kThemeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Image.asset(
      "assets/esewa.png",
      height: 100,
      width: 200,
    );
  }

  Future<void> saveDataLocal({String id, String password}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref);
    await pref.setString("id", id);
    await pref.setString("password", password);
    return true;
  }
}
