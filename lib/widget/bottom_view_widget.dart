import 'dart:ui';

import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.90,
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xFF1B1B1B),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Popular Services",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            height: MediaQuery.of(context).size.height * 0.15,
            //color: Colors.amber,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                BottomListViewItem(
                  imageUrl:
                      "https://www.collegenp.com/uploads/2019/10/Lok-Sewa-Aayog-Logo.png",
                  name: "Lok Sewa",
                ),
                BottomListViewItem(
                  imageUrl:
                      "https://explore.com.np/cms/assets/kcfinder/images/files/ctevt-img.jpg",
                  name: "CTEVT",
                ),
                BottomListViewItem(
                  imageUrl:
                      "https://admin.dishhome.com.np/uploads/images/offer/main/2909837cb522ff2d29e5f252ac25afcc.jpg",
                  name: "Dish Home",
                ),
                BottomListViewItem(
                  imageUrl:
                      "https://d1pe6f90ru47yo.cloudfront.net/wp-content/uploads/2018/07/13063550/IDP_Logo-860x375.jpg",
                  name: "IDP IELTS",
                ),
                BottomListViewItem(
                  imageUrl:
                      "https://contents.sharesansar.com/photos/JAN%2027/Ncell_Main%20Logo%20(1).jpg",
                  name: "Ncell Pack",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomListViewItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const BottomListViewItem({this.imageUrl, this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.10,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 30,
              width: 80,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
