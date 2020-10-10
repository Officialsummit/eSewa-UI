import 'package:class_01/model/model.dart';
import 'package:flutter/material.dart';

class MidViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19),
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: Color(0xFF1B1B1B),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            IconModel iconItem = items[index];
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Icon(
                    iconItem.iconData,
                    color: Color(0xff4AA124),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    iconItem.iconName,
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff4AA124),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
