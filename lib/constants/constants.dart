import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color kThemeColor = Color(0xff4AA124);
InputDecoration kTextFieldDecoration = InputDecoration(
  fillColor: Color(0xFFF6F6F6),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.blue),
  ),
);
