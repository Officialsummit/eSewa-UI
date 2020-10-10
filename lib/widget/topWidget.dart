import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopContainerWidget extends StatelessWidget {
  const TopContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: screenheight * 0.22,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color(0xff4AA124),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Color(0xFF252628),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            height: screenheight * 0.09,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.wallet,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "NPR 100.95",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Balance",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "96.16",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Reward Point",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    ImageIcon(
                      AssetImage("assets/badge.png"),
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF1B1B1B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            height: screenheight * 0.1,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TopItemsWidget(
                  icon1: FontAwesomeIcons.arrowUp,
                  icon2: FontAwesomeIcons.wallet,
                  iconName: "Load Money",
                ),
                TopItemsWidget(
                  icon1: FontAwesomeIcons.arrowDown,
                  icon2: FontAwesomeIcons.wallet,
                  iconName: "Send Money",
                ),
                TopItemsWidget(
                  icon1: FontAwesomeIcons.sortAmountUp,
                  icon2: FontAwesomeIcons.university,
                  iconName: "Bank Transfer",
                ),
                TopItemsWidget(
                  icon1: FontAwesomeIcons.syncAlt,
                  icon2: FontAwesomeIcons.rupeeSign,
                  iconName: "Remittance",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TopItemsWidget extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final String iconName;

  const TopItemsWidget({Key key, this.icon1, this.icon2, this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon1,
          size: 10,
          color: Colors.white,
        ),
        Icon(
          icon2,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          iconName,
          style: TextStyle(fontSize: 12, color: Colors.white),
        )
      ],
    );
  }
}
