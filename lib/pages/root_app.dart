import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zoom_clone/json/root_app.dart';
import 'package:zoom_clone/json/root_app.dart';
import 'package:zoom_clone/themes/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: headerAndFooter,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                (Octicons.mute),
                color: grey,
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                (AntDesign.camera),
                color: grey,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.security_outlined,
                color: green,
                size: 15,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Zoom",
                style: TextStyle(
                    fontSize: 17, color: grey, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: grey,
                size: 20,
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
              child: Text(
                "Leave",
                style: TextStyle(
                    fontSize: 15, color: grey, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: headerAndFooter,
        border:
            Border(top: BorderSide(width: 2, color: black.withOpacity(0.06))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return Column(
                children: [
                  Icon(bottomItems[index],
                      color: colorItems[index], size: sizedItems[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                        fontSize: 10, color: grey, fontWeight: FontWeight.w600),
                  )
                ],
              );
            })),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: black),
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(profileOtherUrl), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
