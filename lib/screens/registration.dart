import 'package:class_01/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String currentGender = "Male";
  bool _isChecked = false;
  bool _autoValidate = false;
  Widget _loadingWidget = Container();
  Color processBtnColor = Colors.grey;
  TextEditingController userId = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 70, right: 25),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 40, color: Colors.grey[600]),
                ),
                Text(
                  "Your mobile number will be your eSewa account ID.",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Mobile Number"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: userId,
                  decoration: kTextFieldDecoration,
                  validator: _validateNumber,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: userPassword,
                  validator: _validatePassword,
                  obscureText: true,
                  decoration: kTextFieldDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Gender"),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DropdownButtonFormField<String>(
                    decoration: kTextFieldDecoration,
                    hint: Text("Select"),
                    items: <String>["Male", "Female", "Other"]
                        .map((String dropdownItem) => DropdownMenuItem(
                              child: Text(dropdownItem),
                              value: dropdownItem,
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        currentGender = newValue;
                        print(currentGender);
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: kThemeColor,
                        value: _isChecked,
                        onChanged: (bool checked) {
                          setState(() {
                            _isChecked = checked;
                            if (_isChecked) {
                              processBtnColor = kThemeColor;
                            } else {
                              processBtnColor = Colors.grey;
                            }
                          });
                        }),
                    Text("I accept "),
                    Text(
                      "Terms and Condition ",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text("and "),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    )
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
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        if (_isChecked) {
                          _saveRegistration(
                            number: userId.text,
                            password: userPassword.text,
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Try Again",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                  content: Text(
                                      "Please accept the terms and conditions"),
                                );
                              });
                        }
                      },
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: processBtnColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Go back",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                ),
                _loadingWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveRegistration({String number, String password}) async {
    setState(() {
      _loadingWidget = Center(
        child: LinearProgressIndicator(
          backgroundColor: Colors.green,
        ),
      );
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));
    await prefs.setString("id", number);
    await prefs.setString("password", password);
    print(prefs.getString("id") + " " + prefs.getString("password"));
    setState(() {
      userId.clear();
      userPassword.clear();
      _loadingWidget = Container(
        color: Colors.black,
      );
    });
  }

//TODO: Implement these validation in form fields later
  String _validateNumber(String val) {
    Pattern numberPattern = r'^(0|94)\d{9,10}$';
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(numberPattern);
    RegExp emailRegex = RegExp(emailPattern);
    if (val.isEmpty) {
      return "Phone Number cannot be empty";
    } else if (!regex.hasMatch(val) || !emailRegex.hasMatch(val))
      return "Enter valid Phone number/email";
    else
      return null;
  }

  String _validatePassword(String val) {
    Pattern pdPattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
    RegExp passRegx = RegExp(pdPattern);
    if (!passRegx.hasMatch(val))
      return "Password must contain minimum eight characters, at least \n one uppercase letter, \n one lowercase letter and one number";
    else
      return null;
  }

  void _validateInput() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
