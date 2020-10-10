import 'package:class_01/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //restricting the app to be in landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {
            runApp(
              MaterialApp(
                debugShowCheckedModeBanner: false,
                home: LoginPage(),
              ),
            ),
          });
}
