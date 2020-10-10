import 'dart:io';

import 'package:class_01/constants/constants.dart';
import 'package:class_01/widget/bottom_view_widget.dart';
import 'package:class_01/widget/fab.dart';
import 'package:class_01/widget/mid_view_widget.dart';
import 'package:class_01/widget/topWidget.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          child: AlertDialog(
            content: Text("Are you sure to exit ?"),
            actions: [
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: kThemeColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
        return;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF252628),
        appBar: AppBar(
          backgroundColor: Color(0xff4AA124),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopContainerWidget(),
              SizedBox(
                height: 10,
              ),
              MidViewWidget(),
              SizedBox(
                height: 10,
              ),
              BottomWidget()
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(
            Icons.qr_code,
            size: 40,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          elevation: 2.0,
        ),
        bottomNavigationBar: FABBottomAppBar(
          items: [
            FABBottomAppBarItem(iconData: FontAwesomeIcons.home, text: "Home"),
            FABBottomAppBarItem(
                iconData: FontAwesomeIcons.fileInvoice, text: "Statement"),
            FABBottomAppBarItem(
                iconData: FontAwesomeIcons.calendarCheck, text: "Payment"),
            FABBottomAppBarItem(
                iconData: FontAwesomeIcons.cartArrowDown, text: "Offers"),
          ],
          notchedShape: CircularNotchedRectangle(),
          color: Colors.white,
          centerItemText: "Scan & pay",
          backgroundColor: Color(0xFF1B1B1B),
          selectedColor: kThemeColor,
          height: 60,
        ),
      ),
    );
  }
}
